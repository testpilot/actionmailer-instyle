# -*- encoding: utf-8 -*-
require File.expand_path('../lib/action_mailer-inline/version', __FILE__)

Gem::Specification.new do |gem|
  gem.authors       = ["Ivan Vanderbyl"]
  gem.email         = ["ivanvanderbyl@me.com"]
  gem.description   = %q{Easily create HTML emails in Rails ~>3.1}
  gem.summary       = %q{This gem brings you the power of the premailer gem to Rails 3
                         without any configuration needs. Create HTML emails, include a
                         CSS file as you do in a normal HTML document and premailer will
                         inline the included CSS.}
  gem.homepage      = "http://github.com/testpilot/action_mailer-inline"

  gem.executables   = `git ls-files -- bin/*`.split("\n").map{ |f| File.basename(f) }
  gem.files         = `git ls-files`.split("\n")
  gem.test_files    = `git ls-files -- {test,spec,features}/*`.split("\n")
  gem.name          = "action_mailer-inline"
  gem.require_paths = ["lib"]
  gem.version       = ActionMailer::Inline::VERSION
end
