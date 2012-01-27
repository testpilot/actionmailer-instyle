class NotificationMailerNoStyle < ActionMailer::Base
  layout "notification_mailer_without_style"

  default from: "Johnny Quids<quidlicker@example.com>"

  def email_with_no_style
    mail(to: "archie@example.com", :subject => "We need dry ice")
  end
end

