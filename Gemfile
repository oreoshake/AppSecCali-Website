source 'https://rubygems.org'

gem 'rails', '~> 4.0.0'

gem 'bootstrap-sass'
gem 'coffee-rails'
gem 'jquery-rails'

gem 'sass-rails'
gem 'uglifier'
gem 'rails_12factor', group: :production
gem 'rack-ssl'
gem 'secure_headers'
gem 'rvm-capistrano'
gem 'dalli'
gem 'newrelic_rpm'

platforms :mri do
  gem 'pg'
end

platforms :jruby do
  gem 'jruby-openssl'
  gem 'activerecord-jdbcmysql-adapter'
end

group :doc do
  gem 'sdoc', require: false
end

group :development do
  gem 'foreman'
end

group :development, :test do
  gem 'growl'
  gem 'rb-fsevent'
  gem 'guard-brakeman'
  gem 'guard-rspec'
  gem 'spork', '~> 1.0rc3'
  gem 'guard-spork'
  gem 'rspec-rails'
  gem 'shoulda'
  gem 'capybara'
  gem 'better_errors'
end
