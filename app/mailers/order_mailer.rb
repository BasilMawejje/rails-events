class OrderMailer < ApplicationMailer
  def order_details(user)
    @user = user
    @cart = User.first.current_user_cart
    @order = User.first.get_cart_events_with_qty

    attachments["order-#{@user}-#{DateTime.now}.pdf"] = OrderPdf.new(@order, view_context).render
    mail(to: @user, subject: "You're ticket has been booked.")
  end
end
