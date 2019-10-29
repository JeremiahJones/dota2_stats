module Dota2Stats
  module V1
    module Response
      class Matches
        include Dota2Stats::V1::Response

        attr_reader :matches

        def initialize(attributes)
          @matches = attributes['result']['matches'].map do |match|
            Dota2Stats::V1::Response::Match.new(match)
          end
        end
      end

      class Match
        include Dota2Stats::V1::Response

        attr_accessor :match_id,
                      :match_seq_num,
                      :start_time,
                      :lobby_type,
                      :radiant_team_id,
                      :dire_team_id

        attr_reader :players

        def players=(attributes)
          @players = attributes.map do |player|
            Dota2Stats::V1::Response::Player.new(player)
          end
        end
      end

      class Player
        include Dota2Stats::V1::Response

        attr_accessor :account_id,
                      :player_slot,
                      :hero_id
      end
    end
  end
end
