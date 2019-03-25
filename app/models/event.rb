class Event < ApplicationRecord
  belongs_to :event_category

  has_many :orders
  has_many :users, through: :orders
end
