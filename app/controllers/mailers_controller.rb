class MailersController < ApplicationController
    http_basic_authenticate_with name: "admin", password: ENV['ADMIN_PASSWORD'] || 'ASDF'

  def newsletter
    @emails = BetaRequest.all.collect(&:email).uniq
  end

  def deliver
    count = if params[:type] == 'newsletter'
      emails = BetaRequest.all.collect(&:email).uniq
      Notifier.newsletter(params[:subject], params[:body], emails).deliver
      emails.size
    end

    flash[:notice] = "Sent an email to #{count} people."
    redirect_to :back
  end
end
