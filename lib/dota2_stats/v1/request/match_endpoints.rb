# frozen_string_literal: true

module Dota2Stats
  module V1
    module Request
      module MatchEndpoints
        MATCH_ROOT = 'IDOTA2Match_570'

        def get_match_history(options = {})
          endpoint = '/GetMatchHistory/v1'

          query_parameters = match_history_options(options)

          response = get_request(MATCH_ROOT, endpoint, query_parameters)

          handle_error(response) unless response.ok?

          Dota2Stats::V1::Response::Matches.from_json(response.body)
        end

        private

        def match_history_options(options = {})
          {
            hero_id: options[:hero_id],
            game_mode: options[:game_mode],
            skill: options[:skill],
            min_players: options[:min_players],
            account_id: options[:account_id],
            league_id: options[:league_id],
            start_at_match_id: options[:start_at_match_id],
            matches_requested: options[:matches_requested]
          }.compact
        end
      end
    end
  end
end
