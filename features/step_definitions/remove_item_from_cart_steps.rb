# frozen_string_literal: true

Then('I click {string} icon') do |_string|
  find('i.fa-trash', visible: true).click
  $redis.flushall
  visit cart_path
end
