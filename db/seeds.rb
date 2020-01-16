AdminUser.create!(email: 'admin@example.com', password: 'password', password_confirmation: 'password') if Rails.env.development?

10.times do
  EventCategory.create({
                           name: Faker::Name.name
                       })
end

EventCategory.all.each do |event_category|
  20.times do
    Event.create({
                    name: Faker::Name.name,
                    description: Faker::Lorem.paragraph(sentence_count: 2),
                    price: 100,
                    image: File.open(File.join(Rails.root, 'public/allstar1.jpg')),
                    alternate_image: File.open(File.join(Rails.root, 'public/allstar2.jpg')),
                    event_category: event_category
                 })
    end
end
