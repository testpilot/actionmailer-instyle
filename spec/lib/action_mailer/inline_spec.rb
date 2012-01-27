require "spec_helper"

describe ActionMailer::InStyle do
  it "is included in Mail interceptors" do
    Mail.class_variable_get("@@delivery_interceptors").should include ActionMailer::InStyle
  end

  let(:original_message) { NotificationMailer.welcome_html_email.deliver }
  let(:message) { ActionMailer::InStyle.delivering_email(original_message) }

  it "should keep text version of email if present" do
    original_message.text_part.body.to_s.should == message.text_part.body.to_s
  end

  it "should have two body parts" do
    message.parts.size.should == 2
  end

  it "should not have a style tag in original email" do
    ActionMailer::InStyle.should_receive(:delivering_email).once
    original_message = NotificationMailer.welcome_html_email.deliver
    Nokogiri::HTML(original_message.html_part.body.to_s).css('body').first.attributes['style'].should be_nil
  end

  it "should replace html version with premailer processed inline version" do
    # If it has a style attribue then we have processed it
    Nokogiri::HTML(message.html_part.body.to_s).css('body').first.attributes['style'].should_not be_nil
  end

  it "should find stylesheet assets" do

  end

  it "should not do anything if no stylesheets are present" do
    message_with_no_css = ActionMailer::InStyle.delivering_email(NotificationMailerNoStyle.email_with_no_style.deliver)
    Nokogiri::HTML(message_with_no_css.html_part.body.to_s).css('body').first.attributes['style'].should be_nil
  end

  it "should inline stylesheets and replace IDs and Classes" do
    # According to the email template the first table usually has a 'striped' class
    Nokogiri::HTML(message.html_part.body.to_s).css('table').first.attributes['class'].should be_nil
  end

  it "should create a text part from the html part if not present" do
    message = ActionMailer::InStyle.delivering_email(NotificationMailer.email_with_html_only.deliver)
    message.text_part.body.to_s.should == "Welcome, this is a HTML email\n\nAnother line"
  end
end
