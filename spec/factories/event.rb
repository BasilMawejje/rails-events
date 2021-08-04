# frozen_string_literal: true

FactoryBot.define do
  factory :event do
    name { 'sample event' }
    event_category_id { 1 }
    description { 'sample description' }
    price { 10 }
    image { 'http://placehold.it/100x100' }
    alternate_image { 'http://placehold.it/100x100' }
  end
end
