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
    $redis.expire(current_user_cart, 1800)
  end

  def add_to_cart(event_id)
    $redis.hincrby current_user_cart, event_id, 1
    cart_expire_time
  end

  def remove_from_cart(event_id)
    $redis.hdel current_user_cart, event_id
  end

  def remove_one_from_cart(event_id)
    $redis.hincrby current_user_cart, event_id, -1
  end

  def cart_count
    quantities = $redis.hvals "cart#{id}"
    quantities.reduce(0) { |sum, qty| sum + qty.to_i }
  end

  def cart_total_price
    get_cart_events_with_qty.map { |event, qty| event.price * qty.to_i }.reduce(:+)
  end

  def get_cart_events_with_qty
    cart_ids = []
    cart_qtys = []
    ($redis.hgetall current_user_cart).map do |key, value|
      cart_ids << key
      cart_qtys << value
    end
    cart_events = Event.find(cart_ids)
    cart_events.zip(cart_qtys)
  end

  def purchase_cart_events!
    $redis.del current_user_cart
  end
end
