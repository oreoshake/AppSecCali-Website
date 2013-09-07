class Notifier < ActionMailer::Base
  include SendGrid
  sendgrid_enable   :ganalytics, :opentrack, :subscriptiontrack
  sendgrid_category :use_subject_lines

  default :from => 'no-reply@appseccalifornia.org'

  # send a signup email to the user, pass in the user object that contains the user's email address
  def cfp_submission(speaker)
    sendgrid_subscriptiontrack_text(:html => 'Unsubscribe <% Here %>', :plain => 'Unsubscribe Here: <% %>')
    @speaker = speaker
    mail( :to => "#{speaker.name} <#{speaker.email}>",
    :subject => 'Your CFP submission has been received.' )
  end
end