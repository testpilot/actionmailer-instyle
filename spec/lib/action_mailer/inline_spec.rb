require "spec_helper"

describe ActionMailer::Inline do
  it "is included in Mail interceptors" do
    Mail.class_variable_get("@@delivery_interceptors").should include ActionMailer::Inline
  end

  it "should return text version of email if not present"

  it "should replace html version with premailer processed inline version"

  it "should find stylesheet assets"

  it "should load stylesheet assets using asset pipeline"

  it "should fallback to email.css if no stylesheets are present"

  it "should not modify text part if already present"

  it "should inline stylesheets and replace IDs and Classes"

  it "should create a text part from the html part if not present"


end
