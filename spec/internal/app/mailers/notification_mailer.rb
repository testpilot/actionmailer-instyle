class NotificationMailer < ActionMailer::Base
  layout "notification_mailer"

  default from: "Johnny Quids<quidlicker@example.com>"

  def welcome_email
    mail(to: "archie@example.com", :subject => "We need dry ice")
  end

  def email_with_html_only
    mail(to: "archie@example.com", :subject => "We need dry ice")
  end

  def welcome_html_email
    mail(to: "archie@example.com", :subject => "We need dry ice")
  end

end
