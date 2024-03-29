# frozen_string_literal: true

Rails.configuration.stripe = {
  publishable_key: ENV['PUBLISHABLE_KEY'],
  secret_key: ENV['SECRET_KEY']
}

Stripe.api_key = Rails.configuration.stripe[:secret_key]
Stripe.api_key = Rails.configuration.stripe[:publishable_key]
