# frozen_string_literal: true

module Dota2Stats
  module V1
    module Request
      module RealtimeStatsEndpoints
        REALTIME_STATS_ROOT = 'IDOTA2MatchStats_570'

        def get_realtime_stats
          endpoint = '/GetRealtimeStats/v1'

          query_parameters = { server_steam_id: config.steam_id_64 }

          response = get_request(REALTIME_STATS_ROOT, endpoint, query_parameters)

          handle_error(response) unless response.ok?

          response.body # Unable to get anything but an empty response back
        end
      end
    end
  end
end
