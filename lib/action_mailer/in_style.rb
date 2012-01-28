require "action_mailer/in_style/version"
require "action_mailer"

module ActionMailer
  module InStyle
    autoload :Processor, 'action_mailer/in_style/processor'
    autoload :Premailer, 'action_mailer/in_style/premailer'

    # delivering_email hook within Mail
    #
    # This is where the whole process kicks off.
    def self.delivering_email(message)
      # If the email contains a html part or is only html
      if message.html_part || (message.content_type =~ /text\/html/ && message)
        InStyle::Processor.inline!(message)
      end
    end
  end
end

ActionMailer::Base.register_interceptor(ActionMailer::InStyle)
