# Load the rails application.
require File.expand_path('../application', __FILE__)

# Initialize the rails application.
RecruitLy::Application.initialize!


ActionMailer::Base.smtp_settings = {
  :user_name => 'neil.matatall@gmail.com',
  :password => ENV['SENDGRID_PASSWORD'],
  :domain => 'appseccalifornia.org',
  :address => 'smtp.sendgrid.net',
  :port => 587,
  :authentication => :plain,
  :enable_starttls_auto => true
}