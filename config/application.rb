require_relative 'boot'

require 'rails/all'

# Require the gems listed in Gemfile, including any gems
# you've limited to :test, :development, or :production.
Bundler.require(*Rails.groups)

module App
  class Application < Rails::Application
    # Initialize configuration defaults for originally generated Rails version.
    config.load_defaults 6.0

    # Settings in config/environments/* take precedence over those specified here.
    # Application configuration can go into files in config/initializers
    # -- all .rb files in that directory are automatically loaded after loading
    # the framework and any gems in your application.

    config.action_dispatch.default_headers = {
      'Content-Security-Policy' => "frame-ancestors *"
    }

    def base_url
      ENV["BASE_URL"]
    end

    def multi_tenancy?
      ENV["MULTI_TENANCY"] == "true"
    end

    def posts_per_page
      15
    end
  end
end
