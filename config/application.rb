require File.expand_path('../boot', __FILE__)

require 'rails/all'

# Require the gems listed in Gemfile, including any gems
# you've limited to :test, :development, or :production.
Bundler.require(:default, Rails.env)

module RecruitLy
  class Application < Rails::Application
    config.generators do |g|
      g.test_framework :rspec
    end
  end
end

# rely on html encoding them and parsing ourselves
ActiveSupport.escape_html_entities_in_json = false
