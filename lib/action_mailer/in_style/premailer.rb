require 'premailer'
module ActionMailer
  module InStyle
    class Premailer < ::Premailer

      def load_css_from_html!
        load_css_from_asset_pipeline!
        super
      end

      # Uses sprockets and the Rails ~>3.1 asset pipeline
      # to load the compiled CSS from stylesheet links within the header of the
      # email temoplate.
      def load_css_from_asset_pipeline!
        if tags = @doc.search("link[@rel='stylesheet'], style")
          tags.each do |tag|
            if tag.to_s.strip =~ /^\<link/i && tag.attributes['href'] && media_type_ok?(tag.attributes['media'])

              # If the stylesheet link begins with /assets we must be using the asset pipeline
              # to generate the css. In this case we should be able to retrieve the css directly
              # from sprockets
              if tag.attributes['href'].to_s =~ /\/assets\//
                link_uri = process_stylesheet_url(tag.attributes['href'])
                asset = Rails.application.assets.find_asset(link_uri)
                @css_parser.add_block!(asset.body) if asset
              end
            end
          end
        end
      end

      def process_stylesheet_url(href)
        # Example stylesheet url: email-1bd4488901bfc2f2ccf4f044fc9154a6.css
        href = href.to_s.sub(/\?[0-9a-zA-Z]+$/, '').sub(/^\/assets\//, '')

        if href =~ /(\w+)\-(?:[0-9a-zA-Z]{32})\.([a-z]{3})/
          href = href.gsub(/(\w+)\-(?:[0-9a-zA-Z]{32})\.([a-z]{3})/, [$1,$2].join('.'))
        end

        return href
      end

    end
  end
end
