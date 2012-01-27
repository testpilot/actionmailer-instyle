# ActionMailer::InStyle

![TestPilot Build Status](http://testpilot.me/testpilot/actionmailer-instyle.png)

HTML Email is hard, especially when you find yourself wrestling with inline CSS to make it look good, luckily for you we're here to make it easy, ActionMailer::InStyle
lets you write standard CSS, using Sass or the likes within the Rails 3.1 Asset Pipeline and automatically converts it to inline CSS using Premailer.

## Requirements

This gem is built specifically to take advantage of the Rails 3.1 Asset Pipeline, as such you must be using Rails ~>3.1

Additonally Ruby 1.8.7 is not supported due to favouring the Ruby 1.9 Hash syntax. If you want 1.8.7 support, issue a pull request.

## Installation

Add this line to your application's Gemfile:

    gem 'actionmailer-instyle'

And then execute:

    $ bundle

## Usage

TODO: Write usage instructions here

## Contributing

1. Fork it
2. Create your feature branch (`git checkout -b my-new-feature`)
3. Commit your changes (`git commit -am 'Added some feature'`)
4. Push to the branch (`git push origin my-new-feature`)
5. Create new Pull Request
