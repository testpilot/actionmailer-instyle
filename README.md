# ActionMailer::InStyle

![TestPilot Build Status](http://testpilot.me/testpilot/actionmailer-instyle.png)

HTML Email is hard, especially when you find yourself wrestling with inline CSS to make it look good, luckily for you we're here to make it easy, ActionMailer::InStyle
lets you write standard CSS, using Sass or the likes within the Rails 3.1 Asset Pipeline and automatically converts it to inline CSS using Premailer.

## Requirements

This gem is built specifically to take advantage of the Rails 3.1 Asset Pipeline, as such you must be using Rails ~>3.1

_Additonally Ruby 1.8.7 is not supported due to favouring the Ruby 1.9 Hash syntax. If you want 1.8.7 support, issue a pull request._

## Installation

Add this line to your application's Gemfile:

    gem 'actionmailer-instyle'

And then execute:

    $ bundle

## Usage

Once installed it will add the required hooks out of the box.

*Stylesheets*

As with all your other stylesheets, put them in `app/assets/stylesheets` and include them into your mailer
template using `stylesheet_include_tag "account_mailer"`, where `account_mailer` is the filename less the extension of the stylesheet you want to
include.

Everything runs through the Asset Pipeline so you can use Sass simply by adding the `.scss` extension as you would with all other stylesheets.

*Compass*

Because Sass works out of the box, you can also include compass for browser specific mixins, keeping in mind that some email client (Outlook for example)
use very crappy rendering engines and some CSS properties may have undesired effects or not work at all.

For a complete rundown on what is supported, checkout this guide which CampaignMonitor has compiled.

(CampaignMonitor's guide to CSS support in email)[http://www.campaignmonitor.com/css/]

## Contributing

1. Fork it
2. Create your feature branch (`git checkout -b my-new-feature`)
3. Commit your changes (`git commit -am 'Added some feature'`)
4. Push to the branch (`git push origin my-new-feature`)
5. Create new Pull Request
