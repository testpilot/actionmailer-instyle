require "action_mailer/inline/version"

module ActionMailer
  module Inline
    def self.delivering_email(message)
      
    end
  end
end

ActionMailer::Base.register_interceptor(ActionMailer::Inline)
