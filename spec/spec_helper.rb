require 'coveralls'
Coveralls.wear!

ENV['RACK_ENV']    = 'test'
ENV['ENVIRONMENT'] = 'test'

require          'database_connection'
require_relative '../database_connection_setup'
require_relative 'setup_test_database'

require_relative '../app'

require 'sinatra'
require 'capybara'
require 'capybara/rspec'
require 'rspec'

Capybara.app = BookmarkManager

RSpec.configure do |config|
  config.before(:each) { setup_test_database }

  config.expect_with :rspec do |expectations|
    expectations.include_chain_clauses_in_custom_matcher_descriptions = true
  end

  config.mock_with :rspec do |mocks|
    mocks.verify_partial_doubles = true
  end

  config.shared_context_metadata_behavior = :apply_to_host_groups
end
