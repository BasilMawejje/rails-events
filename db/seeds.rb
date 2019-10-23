# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the rails db:seed command (or created alongside the database with db:setup).
#
# Examples:
#
#   movies = Movie.create([{ name: 'Star Wars' }, { name: 'Lord of the Rings' }])
#   Character.create(name: 'Luke', movie: movies.first)
# AdminUser.create!(email: 'admin@example.com', password: 'password', password_confirmation: 'password') if Rails.env.development?

5.times do
  EventCategory.create({
                           name: Faker::Name.name
                       })
end

EventCategory.all.each do |event_category|
  15.times do
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