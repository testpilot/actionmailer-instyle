require "spec_helper"

describe ActionMailer::InStyle::Premailer do
  it 'it should handle stylesheet links containing cache token' do
    ActionMailer::InStyle::Premailer.new('', :with_html_string => true, :remove_classes => true).process_stylesheet_url('/assets/email.css?jf87kjJHj787JHJGH').should == 'email.css'
  end
end
