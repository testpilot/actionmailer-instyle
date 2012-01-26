require 'nokogiri'
require "combustion"

require 'action_mailer/inline'

Combustion.initialize! :action_controller, :action_view, :sprockets, :action_mailer

RSpec.configure do |config|
  config.mock_with :rspec
end


