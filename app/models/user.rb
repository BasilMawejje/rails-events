# frozen_string_literal: true

class User < ApplicationRecord
  # Include default devise modules. Others available are:
  # :confirmable, :lockable, :timeoutable, :trackable and :omniauthable
  devise :database_authenticatable, :registerable,
         :recoverable, :rememberable, :validatable

  has_many :orders
  has_many :events, through: :orders

  def current_user_cart
    "cart#{id}"
  end

  def cart_expire_time
    $redis.with do |conn|
        conn.expire(current_user_cart, 1800)
    end
  end

  def add_to_cart(event_id)
    $redis.with do |conn|
        conn.pipelined do |pipeline|
            pipeline.hincrby(current_user_cart, event_id, 1)
            pipeline.expire(current_user_cart, 1800)
        end
    end
  end

  def remove_from_cart(event_id)
    $redis.with do |conn|
        conn.hdel(current_user_cart, event_id)
    end
  end

  def remove_one_from_cart(event_id)
    $redis.with do |conn|
        new_qty = conn.hincrby(current_user_cart, event_id, -1)
        conn.hdel(current_user_cart, event_id) if new_qty <= 0
    end
  end

  def cart_count
    $redis.with do |conn|
        quantities = conn.hvals(current_user_cart)
        quantities.sum(&:to_i)
    end
  end

  def cart_total_price
    cart_data = $redis.with { |conn| conn.hgetall(current_user_cart) }
    return 0 if cart_data.empty?

    prices = Event.where(id: cart_data.keys).pluck(:id, :price).to_h

    cart_data.sum do |event_id, qty|
        price = prices[event_id.to_i] || 0
        price * qty.to_i
    end
  end

  def get_cart_events_with_qty
    cart_ids = []
    cart_qtys = []
    ($redis.with { |conn| conn.hgetall current_user_cart }).map do |key, value|
      cart_ids << key
      cart_qtys << value
    end
    cart_events = Event.find(cart_ids)
    cart_events.zip(cart_qtys)
  end

  def purchase_cart_events!
    $redis.with do |conn|
        conn.del(current_user_cart)
    end
  end
end
