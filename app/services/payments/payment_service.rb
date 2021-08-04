# frozen_string_literal: true

module Payments
  class PaymentService < ApplicationService
    DEFAULT_CURRENCY = 'usd'

    def initialize(params, user)
      @stripe_email = params[:stripeEmail]
      @stripe_token = params[:stripeToken]
      @user = user
    end

    def call
      create_charge(create_customer)
    end

    private

    attr_accessor :user, :stripe_email, :stripe_token

    def create_customer
      Stripe::Customer.create(
        email: stripe_email,
        source: stripe_token
      )
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
end
