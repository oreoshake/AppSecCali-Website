class Notifier < ActionMailer::Base
  include SendGrid
  sendgrid_enable   :subscriptiontrack
  sendgrid_category :use_subject_lines

  default :from => 'owasp-cali-planners@appseccalifornia.org'

  def cfp_submission(speaker)
    sendgrid_recipients ["owasp-cali-planners@appseccalifornia.org"]
    @speaker = speaker
    mail( to: 'owasp-cali-planners@appseccalifornia.org',
      subject: 'Your CFP submission has been received.' )
  end
end