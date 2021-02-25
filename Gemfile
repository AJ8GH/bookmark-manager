# frozen_string_literal: true

source 'https://rubygems.org'

ruby '2.7.2'

group :development, :production do
  gem 'puma'
  gem 'rack'
  gem 'sinatra'
  gem 'pg'
end

group :test, :development do
  gem 'rake'
  gem 'rubocop', require: false
end

group :test do
  gem 'capybara'
  gem 'coveralls', require: false
  gem 'rspec'
end
