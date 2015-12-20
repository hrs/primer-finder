source "http://rubygems.org"

ruby "2.2.3"

gem "sinatra"

group :production do
  gem "unicorn"
end

group :development, :test do
  gem "pry"
  gem "rake"
  gem "rspec"
  gem "simplecov"
  gem "shotgun"
end

group :test do
  gem "capybara"
  gem "launchy"
end
