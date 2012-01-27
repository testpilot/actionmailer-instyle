# ActionMailer::InStyle

![TestPilot Build Status](http://testpilot.me/testpilot/actionmailer-instyle.png)

HTML Email is hard, especially when you find yourself wrestling with inline CSS to make it look good, luckily for you we're here to make it easy, ActionMailer::InStyle
lets you write standard CSS, using Sass or the likes within the Rails 3.1 Asset Pipeline and automatically converts it to inline CSS using Premailer.

## Requirements

This gem is built specifically to take advantage of the Rails 3.1 Asset Pipeline, as such you must be using Rails ~>3.1 and have the Asset Pipeline enabled (default)
_Additonally Ruby 1.8.7 is not supported due to favouring the Ruby 1.9 Hash syntax. If you want 1.8.7 support, issue a pull request._

## Installation

Add this line to your application's Gemfile:

```ruby
gem 'actionmailer-instyle'
```

And then execute:

```bash
$ bundle
```

## Usage

Once installed it will add the required hooks out of the box to intercept each email being sent.

*Stylesheets*

As with all your other stylesheets, put them in `app/assets/stylesheets` and include them into your mailer
template using `stylesheet_include_tag "account_mailer"`, where `account_mailer` is the filename less the extension of the stylesheet you want to
include.

Everything runs through the Asset Pipeline so you can use Sass simply by adding the `.scss` extension as you would with all other stylesheets.

*Compass*

Because Sass works out of the box, you can also include Compass for browser specific mixins and useful CSS3 helpers, keeping in mind that some email client (Outlook for example) use very dated rendering engines and some CSS properties may have undesired effects or not work at all.

For a complete rundown on what is supported, checkout this guide which CampaignMonitor has compiled.

[CampaignMonitor's guide to CSS support in email](http://www.campaignmonitor.com/css/)

## Tutorial

*1. Generate a Mailer:*

    rails g mailer account_mailer account_created_email

*2. Create a template to be used for emails this Mailer sends:*

In `app/views/layouts/account_mailer.html.haml`

```haml
%html
  %head
    = stylesheet_include_tag "account_mailer"

  %body
    %table.main
      %tr
        %td= yield
```

You will notice that we have added a stylesheet in the head, the location is not crucial, but the use of `stylesheet_include_tag` is because it will generate a link which we can process and feed through Sprockets in order to generate the inline styles.

*3. The stylesheet.*

You can use any style off CSS you like, you can even include other application styles — such as activity feed styles if you are emailing a digest of an activity feed.

`app/assets/stylesheets/account_mailer.css.scss`:

```css
body {
  font-family: 'Helvetica Neue', Helvetica, sans-serif;
  -webkit-font-smoothing: antialiased;
  width: 100%
  background: darken(white, 8%);
}

table {
  background: white;
  &.main {
    width: 430px;
    tr td {
      padding: 5px;
    }
  }
}
```

*4. Email views.*

In order to take advantage of all this fancy work, you must define a html view for your email, and optionally a text version. By default we will automatically generate a text version from the text content of the html view if none is supplied.

## Contributing

1. Fork it
2. Create your feature branch (`git checkout -b my-new-feature`)
3. Commit your changes (`git commit -am 'Added some feature'`)
4. Push to the branch (`git push origin my-new-feature`)
5. Create new Pull Request
