class OrderPdf < Prawn::Document
  def initialize(order, view)
    super()
    @order = order
    @view = view

    order_number
    line_items
    total_price
  end

  def order_number
    text "Order \##{@order.hash}", size: 30, style: :bold
  end

  def line_items
    move_down 20
    table line_item_rows do
      row(0).font_style = :bold
      columns(1..3).align = :right
      self.row_colors = ["DDDDDD", "FFFFFF"]
      self.header = true
    end
  end

  def line_item_rows
    [["Product id", "Product Name", "Product Description", "Product Price", "Qty"]] +
        @order.map do |item|
          item_properties = item[0].attributes
          [item_properties.values[0], item_properties.values[1], item_properties.values[2], price(item_properties.values[3]), item[1]]
        end
  end

  def price(num)
    @view.number_to_currency(num)
  end

  def total_price
    move_down 15
    total_price = @order.map { |event, qty| event.price * qty.to_i }.reduce(:+)
    text "Total price: #{price(total_price)}", size: 16, style: :bold
  end
end