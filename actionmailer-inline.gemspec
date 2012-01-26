# -*- encoding: utf-8 -*-
require File.expand_path('../lib/action_mailer/inline/version', __FILE__)

Gem::Specification.new do |gem|
  gem.authors       = ["Ivan Vanderbyl"]
  gem.email         = ["ivanvanderbyl@me.com"]
  gem.description   = %q{Easily create HTML emails in Rails ~>3.1}
  gem.summary       = %q{This gem brings you the power of the premailer gem to Rails 3
                         without any configuration needs. Create HTML emails, include a
                         CSS file as you do in a normal HTML document and premailer will
                         inline the included CSS.}
  gem.homepage      = "http://github.com/testpilot/actionmailer-inline"

  gem.executables   = `git ls-files -- bin/*`.split("\n").map{ |f| File.basename(f) }
  gem.files         = `git ls-files`.split("\n")
  gem.test_files    = `git ls-files -- {test,spec,features}/*`.split("\n")
  gem.name          = "actionmailer-inline"
  gem.require_paths = ["lib"]
  gem.version       = ActionMailer::Inline::VERSION

  gem.add_dependency("premailer", ["~> 1.7"])
  gem.add_dependency("rails", ["~> 3.1"])

  gem.add_development_dependency 'rspec-rails', '~> 2.8.0'
  gem.add_development_dependency 'sass', '~> 3.1'
  gem.add_development_dependency 'sqlite3', '1.3.5'
  gem.add_development_dependency 'mail'
  gem.add_development_dependency 'nokogiri'
  gem.add_development_dependency 'combustion', '~> 0.3.1'

end
