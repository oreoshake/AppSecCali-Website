class Notifier < ActionMailer::Base
  include SendGrid
  sendgrid_enable   :subscriptiontrack
  sendgrid_category :use_subject_lines

  default :from => "owasp-cali-planners@owasp.org"

  def cfp_submission(speaker)
    return true if Rails.env.development?
    sendgrid_recipients ["owasp-cali-planners@owasp.org"]
    @speaker = speaker
    mail( to: "owasp-cali-planners@owasp.org",
      subject: 'Your CFP submission has been received.' )
  end
end