class ApplicationController < ActionController::Base
  protect_from_forgery with: :exception
  ensure_security_headers

private

  def setup_mailchimp
    @mailchimp = Mailchimp::API.new(ENV['MAILCHIMP_PASSWORD']) # unless Rails.env.test?
  end

  def subscribe(id, email, name)

    puts @mailchimp.lists.inspect
    # return true if Rails.env.test?
    name = name.split
    begin
      res = @mailchimp.lists.subscribe(id, {email: email}, {FNAME: name.first, LNAME: name.last})
      Rails.logger.info("mailchimp res: #{res.inspect}")
      return true
    rescue Mailchimp::ListAlreadySubscribedError
      flash[:error] = "#{email} is already subscribed to the list"
    rescue Mailchimp::Error, Mailchimp::ListInvalidImportError, Mailchimp::ListDoesNotExistError => ex
      Rails.logger.error("Unknown mailchimp error #{ex.message}")
      flash[:error] = "Something went wrong, you were not subscribed."
      raise ex unless Rails.env.production?
    end

    nil
  end
end
