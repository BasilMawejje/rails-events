class ChargesController < ApplicationController
  def new
  end

  def create
    PaymentService.new(charge_params, current_user).call
    redirect_to root_path
  end

  private

  def charge_params
    params.permit(:stripeEmail, :stripeToken, :cart)
  end
end
