# frozen_string_literal: true

FactoryBot.define do
  factory :admin_user do
    email { 'admin_features@test.com' }
    password { 'password' }
  end
end
