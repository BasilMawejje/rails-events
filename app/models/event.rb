class Event < ApplicationRecord
  mount_uploader :image, ImageUploader
  mount_uploader :alternate_image, AlternateImageUploader

  belongs_to :event_category
  has_many :orders
  has_many :users, through: :orders
end
