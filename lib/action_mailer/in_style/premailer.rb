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
                link_uri = tag.attributes['href'].to_s.sub(/\?[0-9a-zA-Z]+$/, '').sub(/^\/assets\//, '')
                asset = Rails.application.assets.find_asset(link_uri)
                @css_parser.add_block!(asset.body) if asset
              end
            end
          end
        end
      end

    end
  end
end
