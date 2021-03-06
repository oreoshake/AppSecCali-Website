class ApplicationController < ActionController::Base
  protect_from_forgery with: :exception
  ensure_security_headers
  before_filter :build_beta_request



private

  def build_beta_request
    @beta_request = BetaRequest.new
  end

  def setup_mailchimp
    @mailchimp = Mailchimp::API.new(ENV['MAILCHIMP_PASSWORD']) # unless Rails.env.test?
  end

  def subscribe(id, email, name)
    name = name.split
    begin
      res = @mailchimp.lists.subscribe(id, {email: email}, {FNAME: name.first, LNAME: name.last})
      Rails.logger.info("mailchimp res: #{res.inspect}")
      true
    rescue Mailchimp::ListAlreadySubscribedError
      true
    rescue Mailchimp::Error, Mailchimp::ListInvalidImportError, Mailchimp::ListDoesNotExistError => ex
      Rails.logger.error("Unknown mailchimp error #{ex.message}")
      flash[:error] = "Something went wrong, you were not subscribed."
      raise ex unless Rails.env.production?
    end
  end
end
