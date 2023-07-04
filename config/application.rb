require_relative 'boot'

require 'rails'
# Pick the frameworks you want:
require 'active_model/railtie'
require 'active_job/railtie'
require 'active_record/railtie'
require 'active_storage/engine'
require 'action_controller/railtie'
require 'action_mailer/railtie'
require 'action_mailbox/engine'
require 'action_text/engine'
require 'action_view/railtie'
require 'action_cable/engine'
# require "rails/test_unit/railtie"

# Require the gems listed in Gemfile, including any gems
# you've limited to :test, :development, or :production.
Bundler.require(*Rails.groups)

module NoteAppBackend
  class Application < Rails::Application
    config.load_defaults 7.0

    config.eager_load_paths << Rails.root.join('lib')

    config.i18n.available_locales = [:en]

    config.action_mailer.default_url_options = {
      host: 'localhost',
      port: '3000'
    }

    config.action_mailer.smtp_settings = {
      address: 'localhost',
      port: 1025
    }

    config.api_only = true
  end
end
