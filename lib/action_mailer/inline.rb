require "action_mailer/inline/version"
require "action_mailer/base"

module ActionMailer
  module Inline
    autoload :Processor, 'action_mailer/inline/processor'
    autoload :Premailer, 'action_mailer/inline/premailer'

    # delivering_email hook within Mail
    #
    # This is where the whole process kicks off.
    def self.delivering_email(message)
      # If the email contains a html part or is only html
      if message.html_part || (message.content_type =~ /text\/html/ && message)
        Inline::Processor.inline!(message)
      end
    end
  end
end

ActionMailer::Base.register_interceptor(ActionMailer::Inline)
