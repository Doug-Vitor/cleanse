# frozen_string_literal: true

require 'rails/railtie'

module Cleanse
  class Railtie < Rails::Railtie
    initializer 'cleanse.autoloader' do
      Rails.autoloaders.main.on_load do |_cpath, value, _abspath|
        Cleanse.clean_rails_model!(value)
      end
    end

    config.to_prepare do
      Cleanse.clean_rails_models!
    end
  end
end
