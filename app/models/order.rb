# frozen_string_literal: true

class Order < ApplicationRecord
  belongs_to :event
  belongs_to :user
end
