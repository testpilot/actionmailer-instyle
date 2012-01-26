require "spec_helper"

describe ActionMailer::Inline do
  describe "CSS" do
    it "Should return a CSS String" do
      Rails.application.assets.find_asset('notification_mailer.css.scss').body.should ==
        "body {\n  font-family: 'Helvetica Neue', Helvetica, Ariel, sans-serif;\n  font-size: 13px;\n  color: #4d4d4d; }\n"
    end
  end
end
