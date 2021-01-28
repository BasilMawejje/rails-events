class ChargesController < ApplicationController
  def new
  end

  def create
    Stripe.api_key = Rails.configuration.stripe[:secret_key]

    Payments::PaymentService.new(charge_params, current_user).call
    OrderMailerWorker.perform_async(current_user.email)
    redirect_to order_path
  end

  private

  def charge_params
    params.permit(:stripeEmail, :stripeToken, :cart)
  end
end
