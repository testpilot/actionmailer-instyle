require 'rubygems'
require 'bundler'

Bundler.require

require "rails"
require "combustion"

Combustion.initialize! 
# :action_controller, :action_view, :sprockets, :action_mailer

require 'rspec/rails'

require 'nokogiri'
require "combustion"

require 'action_mailer/inline'

RSpec.configure do |config|
  config.mock_with :rspec
end


