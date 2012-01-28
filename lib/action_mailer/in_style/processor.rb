require "premailer"

module ActionMailer
  module InStyle
    class Processor

      def self.inline!(message)
        new(message).inline!
      end

      attr_reader :message, :premailer

      # Initialize
      # Accepts one argument:
      # - ActionMailer message object
      def initialize(message)
        @message = message

        @existing_html_part = message.html_part || (message.content_type =~ /text\/html/ && message)
        @premailer = ActionMailer::InStyle::Premailer.new(html_part.body.to_s, :with_html_string => true, :remove_classes => true)
      end

      def html_part
        @existing_html_part
      end

      # InStyle!
      # Processes the message object, replacing the html part with an inlined
      # html version.
      #
      # If the message contains attachments or text parts, these parts are preserved.
      # If the message does not contain a text part, one will be constructed from the text
      # content available in the html part.
      def inline!
        capture_existing_message_parts
        reset_message_body!

        add_text_part!
        add_html_part!
        add_attachments!

        message
      end

      # Add an HTML part with CSS inlined.
      def add_html_part!
        part = Mail::Part.new
        part.body = premailer.to_inline_css
        part.content_type = "text/html; charset=#{@msg_charset}"
        message.html_part = part
      end

      # Add a text part with either the pre-existing text part, or one generated with premailer.
      def add_text_part!
        part = Mail::Part.new
        part.body = @existing_text_part || premailer.to_plain_text
        part.content_type = "text/plain; charset=#{@msg_charset}"
        message.text_part = part
      end

      # Re-add any attachments
      def add_attachments!
        @existing_attachments.each {|a| message.body << a }
      end

      def capture_existing_message_parts
        @existing_text_part    = message.text_part && message.text_part.body.to_s
        @existing_attachments  = message.attachments
        @msg_charset           = message.charset
      end

      def original_message_parts
        capture_existing_message_parts

        {
          :html_part    => html_part,
          :text_part    => @existing_text_part,
          :attachments  => @existing_attachments,
          :charset      => @msg_charset
        }
      end

      def reset_message_body!
        message.body = nil
        message.body.instance_variable_set("@parts", Mail::PartsList.new)
      end

    end
  end
end
