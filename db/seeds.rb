# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the rails db:seed command (or created alongside the database with db:setup).
#
# Examples:
#
#   movies = Movie.create([{ name: 'Star Wars' }, { name: 'Lord of the Rings' }])
#   Character.create(name: 'Luke', movie: movies.first)
AdminUser.create!(email: 'admin@example.com', password: 'password', password_confirmation: 'password') if Rails.env.development?

10.times do
  EventCategory.create({
                name: Faker::Name.name
              })
end

25.times do
  Event.create({
                name: Faker::Name.name,
                description: Faker::Lorem.paragraph(sentence_count: 2),
                price: 100,
                image: 'http://placehold.it/100x100',
                alternate_image: 'http://placehold.it/100x100',
                event_category: EventCategory.first
               })
end