class OrdersController < ApplicationController
  def show
    @order = current_user.get_cart_events_with_qty

    respond_to do |format|
      format.html
      format.pdf do
        pdf = OrderPdf.new(@order, view_context)
        send_data pdf.render, filename: "order-#{current_user.email}-#{DateTime.now}",
                              type: 'application/pdf',
                              disposition: 'inline'
      end
    end
  end
end
