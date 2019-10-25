require_relative 'boot'

require 'rails/all'

# Require the gems listed in Gemfile, including any gems
# you've limited to :test, :development, or :production.
Bundler.require(*Rails.groups)

module FirstSite
  class Application < Rails::Application
    # Initialize configuration defaults for originally generated Rails version.
    config.load_defaults 5.2

    # Settings in config/environments/* take precedence over those specified here.
    # Application configuration can go into files in config/initializers
    # -- all .rb files in that directory are automatically loaded after loading
    # the framework and any gems in your application.
    config.time_zone = 'Kyiv'

    config.i18n.available_locales = [:uk, :en]
    config.i18n.default_locale = :uk
    I18n.enforce_available_locales = false
    config.i18n.load_path += Dir["#{Rails.root}/config/locales/**/*.{rb,yml}"]
    config.autoload_paths += %W(#{config.root}/app/forms)

    config.autoload_paths += %W(#{config.root}/lib)
    config.autoload_paths += %W(#{config.root}/app/jobs)


  end
end
