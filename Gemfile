source "https://rubygems.org"
git_source(:github) { |repo| "https://github.com/#{repo}.git" }

ruby "3.2.2"

gem "bootsnap", require: false
gem "devise", "~> 4.9", ">= 4.9.2"
gem "devise-i18n"
gem "importmap-rails"
gem "jbuilder"
gem "pg", "~> 1.1"
gem "puma", "~> 5.0"
gem "rails", "~> 7.0.7", ">= 7.0.7.2"
gem "redis", "~> 4.0"
gem "sprockets-rails"
gem "stimulus-rails"
gem "turbo-rails"
gem "tzinfo-data", platforms: %i[mingw mswin x64_mingw jruby]

group :development, :test do
  gem "annotate", "~> 3.2"
  gem "debug", platforms: %i[mri mingw x64_mingw]
end

group :development do
  gem "rubocop", "~> 1.56", ">= 1.56.2"
  gem "rubocop-rails", "~> 2.21"
  gem "rubocop-rspec", "~> 2.24"
  gem "web-console"
end

group :test do
  gem "capybara"
  gem "rspec", "~> 3.12"
  gem "rspec-rails", "~> 6.0", ">= 6.0.3"
  gem "selenium-webdriver"
  gem "webdrivers"
end
