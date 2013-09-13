class Notifier < ActionMailer::Base
  include SendGrid
  sendgrid_enable   :subscriptiontrack
  sendgrid_category :use_subject_lines

  default :from => 'owasp-cali-planners@appseccalifornia.org'

  def cfp_submission(speaker)
    sendgrid_recipients ["owasp-cali-planners@appseccalifornia.org", speaker.email]
    sendgrid_subscriptiontrack_text(:replace => '|unsubscribe_link|')
    @speaker = speaker
    mail( to: speaker.email,
      subject: 'Your CFP submission has been received.' )
  end

  def newletter_signup(email)
    attachments.inline['banner.jpg'] = File.read(Rails.root.join('app/assets/images/banner_small.png'))
    sendgrid_recipients ["neil.matatall@gmail.com", email]
    sendgrid_subscriptiontrack_text(:replace => '|unsubscribe_link|')
    mail( to: email,
      subject: 'Thanks for joining signing up for the newsletter.' )
  end

  def newsletter(subject, body, emails)
    Rails.logger.info("Sending email to " + emails.count.to_s)
    attachments.inline['banner.jpg'] = File.read(Rails.root.join('app/assets/images/banner_small.png'))
    @body = body
    emails << "neil.matatall@gmail.com"
    sendgrid_recipients([ "neil.matatall@gmail.com"])
    sendgrid_subscriptiontrack_text(:replace => '|unsubscribe_link|')
    mail(subject: subject )
  end
end