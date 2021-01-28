class OrdersController < ApplicationController
  def show
    @cart = current_user.current_user_cart
    @order = current_user.get_cart_events_with_qty

    respond_to do |format|
      format.html
      format.pdf do
        pdf = OrderPdf.new(@order, view_context)
        send_data pdf.render, filename: "order-#{current_user.email}-#{DateTime.now}",
                  type: 'application/pdf',
                  disposition: 'inline'
      end
      expire_paid_cart
    end
  end

  private

  def expire_paid_cart
    $redis.expire(@cart, 60)
  end
end