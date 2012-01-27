require 'rubygems'
require 'bundler'

Bundler.require

require "rails"
require "combustion"

Combustion.initialize!

require 'rspec/rails'

require 'nokogiri'
require "combustion"

require 'action_mailer/in_style'

RSpec.configure do |config|
  config.mock_with :rspec

  config.before do
    ActionMailer::Base.delivery_method = :test
  end
end
