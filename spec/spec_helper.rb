require "bundler/setup"
require "rspec/core"
require "rack/test"

require "prime"
require "prime_server"

set :environment, :test

RSpec.configure do |config|
  config.mock_with :rspec
end
