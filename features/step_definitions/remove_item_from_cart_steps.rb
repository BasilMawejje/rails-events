Then("I click {string} icon") do |string|
  # binding.pry
  find('i.fa-trash', :visible => true).click
  @event = Event.first
  $redis.hdel "cart#{@event.id}", @event.id
  visit cart_path
end