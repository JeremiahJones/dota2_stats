# frozen_string_literal: true

module Dota2Stats
  module V1
    module Request
      module HeroEndpoints
        HERO_ROOT = '/IEconDOTA2_570/GetHeroes/v1'

        def get_heroes
          endpoint = HERO_ROOT

          response = get_request(nil, endpoint)

          handle_error(response) unless response.ok?

          Dota2Stats::V1::Response::Heroes.from_json(response.body)
        end
      end
    end
  end
end
