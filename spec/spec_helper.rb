require "bundler/setup"
require "rspec/core"
require "capybara/rspec"

require "prime"
require "prime_server"

set :environment, :test
Capybara.app = PrimeServer

RSpec.configure do |config|
  config.mock_with :rspec
end
