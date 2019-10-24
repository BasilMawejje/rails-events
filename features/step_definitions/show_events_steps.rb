Given("the following events with associations exist") do |table|
  table.hashes.each do |hash|
    file = File.new(Rails.root + "spec/fixtures/#{hash[:image]}") if hash[:image]
    FactoryBot.create(:event_category)
    FactoryBot.create(:event, hash)
  end
end

Then("I should see the text {string}") do |message|
  expect(page).to have_content message
end

Then("I should see the button {string}") do |message|
  expect(page).to have_content message
end

Then("show me the page") do
  save_and_open_page
end