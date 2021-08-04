# frozen_string_literal: true

source 'https://rubygems.org'
git_source(:github) { |repo| "https://github.com/#{repo}.git" }

ruby '2.7.4'

gem 'activeadmin'
gem 'bootsnap', '>= 1.1.0', require: false
gem 'carrierwave'
gem 'coffee-rails', '~> 4.2'
gem 'devise'
gem 'dotenv-rails'
gem 'hiredis'
gem 'jbuilder', '~> 2.5'
gem 'pg', '>= 0.18', '< 2.0'
gem 'prawn'
gem 'prawn-table'
gem 'puma', '~> 3.11'
gem 'rails', '~> 5.2.2', '>= 5.2.2.1'
gem 'redis'
gem 'sass-rails', '~> 5.0'
gem 'sidekiq'
gem 'stripe'
gem 'turbolinks', '~> 5'
gem 'uglifier', '>= 1.3.0'

group :development, :test do
  gem 'byebug', platforms: %i[mri mingw x64_mingw]
  gem 'faker'
  gem 'foreman'
  gem 'pry'
  gem 'pry-byebug'
end

group :test do
  gem 'capybara', '>= 2.15'
  gem 'chromedriver-helper'
  gem 'cucumber-rails', require: false
  gem 'database_cleaner'
  gem 'factory_bot_rails'
  gem 'launchy'
  gem 'listen', '>= 3.0.5', '< 3.2'
  gem 'pdf-inspector'
  gem 'rspec-rails'
  gem 'selenium-webdriver'
  gem 'shoulda-matchers'
  gem 'spring'
  gem 'spring-watcher-listen', '~> 2.0.0'
  gem 'stripe-ruby-mock', '~> 2.5.8', require: 'stripe_mock'
  gem 'web-console', '>= 3.3.0', group: :development
end

gem 'tzinfo-data'
