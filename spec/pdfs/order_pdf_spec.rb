require 'rails_helper'

describe 'order_pdf' do
  before do
    FactoryBot.create(:event_category)
    event = FactoryBot.create(:event)
    @order = [[event, 1]]
    view_context = ActionController::Base.new.view_context
    pdf = OrderPdf.new(@order, view_context)
    rendered_pdf = pdf.render
    @text_analysis = PDF::Inspector::Text.analyze(rendered_pdf)
  end

  specify { @text_analysis.strings.should include('Product id', "Product Name", "Product Description", "Product Price", "Qty", "1",
                                                  "sample event", "sample description", "$10.00", "Total price: $10.00") }
end