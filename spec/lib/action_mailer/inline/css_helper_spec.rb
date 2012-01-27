require "spec_helper"

describe ActionMailer::InStyle do
  describe "CSS" do
    it "Should return a CSS String" do
      Rails.application.assets.find_asset('notification_mailer.css.scss').body.should match /font-family: 'Helvetica Neue', Helvetica, Ariel, sans-serif/
    end
  end
end
