class Payments::PaymentService < ApplicationService
  DEFAULT_CURRENCY = 'usd'.freeze

  def initialize(params, user)
    @stripe_email = params[:stripeEmail]
    @stripe_token = params[:stripeToken]
    @cart = user.get_cart_events_with_qty
    @user = user
  end

  def call
    create_charge(create_customer)
  end

  private

  attr_accessor :user, :stripe_email, :stripe_token, :cart

  def create_customer
    customer = Stripe::Customer.create(
      email: stripe_email,
      source: stripe_token
    )
    customer
  end

  def create_charge(customer)
    Stripe::Charge.create(
      customer: customer.id,
      amount: cart_amount,
      description: "What's happening Kampala",
      currency: DEFAULT_CURRENCY
    )
  end

  def cart_amount
    user.cart_total_price.to_i
  end
end
