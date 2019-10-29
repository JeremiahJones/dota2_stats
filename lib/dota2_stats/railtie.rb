# frozen_string_literal: true

module Dota2Stats
  class Railtie < Rails::Railtie
    config.dota2_stats = Dota2Stats.config

    initializer 'dota2_stats_configuration' do |_app|
      if File.exist?(Rails.root.join('config', 'dota2_stats.yml'))
        yaml_file = YAML.load_file(::Rails.root.join('config', 'dota2_stats.yml'))

        Dota2Stats.configure do |config|
          config.base_url = yaml_file['base_url']
          config.steam_api_key = yaml_file['steam_api_key']
        end
      else
        Rails.logger.warn('Failed to load dota2_stats.yml')
      end
    end
  end
end
