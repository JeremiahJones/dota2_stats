module Dota2Stats
  module V1
    class Client
      include Dota2Stats::V1::Request::HeroEndpoints
      include Dota2Stats::V1::Request::RealtimeStatsEndpoints
      include Dota2Stats::V1::Request::MatchEndpoints

      attr_reader :base_url,
                  :http_client,
                  :steam_api_key,
                  :steam_id_64

      def initialize(steam_id_64: nil)
        @base_url = config.base_url
        @steam_api_key = config.steam_api_key
        @http_client = HTTPClient.new
        @steam_id_64 = steam_id_64 || config.steam_id_64
      end

      def config
        @config ||= Dota2Stats.config
      end

      private

      def get_request(endpoint_root, endpoint, query_parameters = {})
        url = url_constructor(endpoint_root, endpoint, query_parameters.to_query)
        http_client.get(url, header: request_headers)
      end

      def handle_error(response)
        if response.content_type =~ %r{application/json}
          raise Dota2Stats::V1::Errors.new(response.body, response.status)
        else
          raise Dota2Stats::V1::Errors::NonJSONResponse.new(response.body, response.status)
        end
      end

      def post_request(endpoint_root, endpoint, body, query_parameters = {})
        url = url_constructor(endpoint_root, endpoint, query_parameters)
        http_client.post(url, body: body, header: request_headers)
      end

      def request_headers
        { 'accept' => 'application/json' }
      end

      def url_constructor(endpoint_root, endpoint, query_parameters)
        url = "#{base_url}#{endpoint_root}#{endpoint}?key=#{config.steam_api_key}"
        query_parameters.blank? ? url : url + "&#{query_parameters}"
      end
    end
  end
end
