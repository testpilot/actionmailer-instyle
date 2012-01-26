class NotificationMailer < ActionMailer::Base
  layout "notification_mailer"

  default from: "Johnny Quids<quidlicker@example.com>"

  def welcome_email
    mail(to: "arhcy@example.com", :subject => "We need dry ice")
  end
end

