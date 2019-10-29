$LOAD_PATH.unshift File.expand_path('../lib', __dir__)
require 'active_support/concern'
require 'active_support/core_ext/string'
require 'bundler/setup'
require 'dota2_stats'
require 'pry'

Dota2Stats.configure do |config|
  config.base_url = 'https://www.all-your-base-url-belongs-to-us.sample.com'
  config.steam_api_key = 'steamy_api_key_goes_here'
end

RSpec.configure do |config|
  config.expect_with :rspec do |c|
    c.syntax = :expect
  end

  # Enable flags like --only-failures and --next-failure
  config.example_status_persistence_file_path = '.rspec_status'

  config.order = 'random'

  def load_fixture(filename)
    File.read(File.join(File.dirname(__FILE__), 'fixtures', filename)).squish
  end
end
