source 'https://rubygems.org'

gem 'sendgrid'
gem 'rails', '~> 4.0.0'
gem 'bootstrap-sass'
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
  gem 'activerecord-jdbcpostgresql-adapter'
end

group :doc do
  gem 'sdoc', require: false
end

group :development do
  gem 'foreman'
end

group :development, :test do
  gem 'binding_of_caller', platform: :mri
  gem 'guard-brakeman'
  gem 'better_errors'
  gem 'growl'
  gem 'rb-fsevent'
  gem 'guard-rspec'
  gem 'spork', '~> 1.0rc3'
  gem 'guard-spork'
  gem 'rspec-rails'
  gem 'shoulda'
  gem 'capybara'
  gem 'poltergeist'
end
