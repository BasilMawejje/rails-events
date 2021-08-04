# frozen_string_literal: true

class EventCategory < ApplicationRecord
  has_many :events
end
