Given("the following user exists") do |table|
  table.hashes.each do |hash|
    @user = FactoryBot.create(:user, hash)
  end
end

Given("the following user is signed in") do |table|
  table.hashes.each do |hash|
    @user = User.find_by(email: hash[:email])
    visit new_user_session_path
    fill_in 'Email', with: hash[:email]
    fill_in 'Password', with: hash[:password]
    click_button 'Log in'
  end
end

Given("I click {string} link") do |button|
  find(class: 'add-to-cart').click
end

Then("I should be on the cart page") do
  visit cart_path
end