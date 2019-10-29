Then("I click {string} icon") do |string|
  find('i.fa-trash', :visible => true).click
  $redis.flushall
  visit cart_path
end