# frozen_string_literal: true

module Dota2Stats
  module V1
    module Response
      extend ActiveSupport::Concern

      class_methods do
        def from_json(json)
          parsed_body = JSON.parse(json)
          new(parsed_body)
        rescue JSON::ParserError
          raise Dota2Stats::V1::Errors, 'JSON parse error'
        end
      end

      def initialize(attributes)
        attributes.each do |key, value|
          underscored_key = key.try(:to_s).try(:underscore)
          next unless underscored_key.present? && respond_to?(underscored_key)

          __send__("#{underscored_key}=", value)
        end
      end
    end
  end
end
