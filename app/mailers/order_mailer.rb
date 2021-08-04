# frozen_string_literal: true

class OrderMailer < ApplicationMailer
  def order_details(user)
    @user = user
    current_customer = User.all.select { |customer| customer.email == user }[0]
    @cart = current_customer.current_user_cart
    @order = current_customer.get_cart_events_with_qty

    attachments["order-#{@user}-#{DateTime.now}.pdf"] = OrderPdf.new(@order, view_context).render
    mail(to: @user, subject: "You're ticket has been booked.")
  end
end
