class OrderMailer < ApplicationMailer
  def order_details(user)
    @user = user
    mail(to: @user, subject: "You're ticket has been booked.")
  end
end
