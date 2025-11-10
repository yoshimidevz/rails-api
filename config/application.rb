require_relative "boot"

require "rails/all"

Bundler.require(*Rails.groups)

module Myapi
  class Application < Rails::Application
    config.load_defaults 8.1

    config.autoload_paths << Rails.root.join('app', 'use_cases')
    config.autoload_lib(ignore: %w[assets tasks])

  
    config.api_only = true

    config.eager_load_paths.delete("#{Rails.root}/app/use_cases")
    config.eager_load_paths.unshift("#{Rails.root}/app")
  end
end
