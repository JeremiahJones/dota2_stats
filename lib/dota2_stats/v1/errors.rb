# frozen_string_literal: true

module Dota2Stats
  module V1
    class Errors < StandardError
      attr_reader :http_status, :error_code

      def initialize(description = nil, http_code = nil, error_code = nil)
        @error_code = error_code
        @http_code = http_code

        description ||= default_message
        description.prepend("[Code #{error_code}] ") if error_code
        description.prepend("[HTTP #{http_code}] ") if http_code
        description.strip!

        super(description)
      end

      def default_message
        'unknown error code'
      end

      class NonJSONResponse < Dota2Stats::V1::Errors; end

      ##
      # API errors
      #
    end
  end
end
