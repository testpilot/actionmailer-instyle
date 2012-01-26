require "action_mailer/inline/version"
require "action_mailer/base"

module ActionMailer
  module Inline
    def self.delivering_email(message)
      
    end
  end
end

ActionMailer::Base.register_interceptor(ActionMailer::Inline)
