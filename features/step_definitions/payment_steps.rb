When(/^I fill in my card details on the stripe form$/) do
  sleep(5)
  @stripe_iframe = all('iframe[name=stripe_checkout_app]').last
  within_frame @stripe_iframe do
    fill_in 'Email', with: 'random@morerandom.com'
    fill_in 'Card number', with: '4242 4242 4242 4242'
    fill_in 'CVC', with: '123'
    fill_in 'cc-exp', with: '12/2021'
  end
end

When(/^I submit the stripe form$/) do
  within_frame @stripe_iframe do
    page.execute_script("$('button').click();")
  end
  sleep(10)
end

Given(/^I click Pay with Card stripe button$/) do
  sleep(0.2)
  find('.stripe-button-el').trigger('click')
  # find('.stripe-button-el', :visible => true).click
end

Then(/^I should be on the payment confirmation page$/) do
  expect(current_path).to eq charges_path
end