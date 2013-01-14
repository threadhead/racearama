source 'http://rubygems.org'

ruby '1.9.3'
gem 'rails', '3.2.11'

# Bundle edge Rails instead:
# gem 'rails', :git => 'git://github.com/rails/rails.git'

gem 'sqlite3'
gem 'thin'
# gem 'mysql2'
gem 'haml'
gem 'devise'
gem 'cancan'
gem 'paperclip'
# gem 'carrierwave'
gem 'fog'
gem 'mini_magick'
gem 'httparty'
gem 'faker'
gem 'factory_girl_rails'
gem 'state_machine'

gem 'jquery-rails'

# Bundle gems for the local environment. Make sure to
# put test-only gems in this group so their generators
# and rake tasks are available in development mode:
group :development, :test do
  gem 'haml-rails'
  gem 'rspec-rails'
  gem 'ffi'
  gem 'capybara'
end

group :development do
  # gem 'meta_request'
  gem 'guard-livereload'
  gem 'rack-livereload'
  gem 'sextant'
  gem "letter_opener"
  gem 'wirble', require: false
  gem 'hirb', require: false
end



group :test do
  gem 'rake' # for travis-ci
  gem 'shoulda-matchers'
  gem 'factory_girl_rails'
  gem 'ffaker'
  gem 'spork-rails'
  gem 'rb-fsevent'
  gem 'terminal-notifier-guard'

  gem 'guard'
  gem 'guard-spork'
  gem 'guard-rspec'
  gem 'rspec-nc'

  gem 'database_cleaner'
  gem 'capybara-webkit'
  gem 'capybara-screenshot'

  # gem 'simplecov', '>= 0.4.0', require: false
  # gem 'simplecov-rcov', require: false
end

group :assets do
  gem 'sass-rails',   '~> 3.2.3'
  gem 'coffee-rails', '~> 3.2.1'

  gem 'uglifier', '>= 1.0.3'
  gem 'therubyracer'
  gem 'less-rails'

  gem 'twitter-bootstrap-rails'
  gem 'compass-rails'
end

group :mac do
  gem 'rb-appscript', :require => false
end
