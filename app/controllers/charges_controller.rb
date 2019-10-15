class ChargesController < ApplicationController

  rescue_from Stripe::CardError, with: :catch_exception

  def new
  end

  def create
    # binding.pry
    Services::Charges::SampleService.new(charge_params, current_user).call
    redirect_to new_charge_path
  end

  private

  def charge_params
    params.permit(:stripeEmail, :stripeToken, :cart)
  end

  def catch_exception
    flash[:error] = exception.message
  end
end
