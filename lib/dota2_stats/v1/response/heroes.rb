module Dota2Stats
  module V1
    module Response
      class Heroes
        include Dota2Stats::V1::Response

        attr_reader :heroes

        def initialize(attributes)
          super(attributes['result'])
        end

        def heroes=(attributes)
          @heroes = attributes.map do |hero|
            Dota2Stats::V1::Response::Hero.new(hero)
          end
        end
      end

      class Hero
        include Dota2Stats::V1::Response

        attr_accessor :id,
                      :name,
                      :localized_name,
                      :primary_attr,
                      :attack_type

        attr_reader :roles

        def roles=(attributes)
          @roles = attributes.map do |role|
            Dota2Stats::V1::Response::Roles.new(role)
          end
        end
      end

      class Roles
        include Dota2Stats::V1::Response

        attr_accessor :carry,
                      :nuker
      end
    end
  end
end
