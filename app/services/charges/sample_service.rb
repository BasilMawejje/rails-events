module services
  module charges
    class SampleService < ApplicationService
      DEFAULT_CURRENCY = 'usd'.freeze

      def initialize(params, user)
        @stripe_email = params[:stripeEmail]
        @stripe_token = params[:stripeToken]
        @cart = cart_events_with_qty
        @user = user
      end

      def call
        create_charge(find_customer)
      end

      private

      attr_accessor :user, :stripe_email, :stripe_token, :cart

      def find_customer
        if user.stripe_token
          retrieve_customer(user.stripe_token)
        else
          create_customer
        end
      end

      def retrieve_customer
        Stripe::Customer.retrieve(stripe_token)
      end

      def create_customer
        customer = Stripe::Customer.create(
          email: stripe_email,
          source: stripe_token
        )

        user.update(stripe_token: customer.id)
        customer
      end

      def create_charge
        Stripe::Charge.create(
          customer: customer.id,
          amount: cart_total,
          description: "What's happening Kampala",
          currency: DEFAULT_CURRENCY
        )
      end

      def cart_amount
        @cart_total
      end
    end
  end
end
