module Qiita
  module Sdk
    class Client
      require 'net/https'
      require 'uri'
      require 'json'

      API_BASE_URL = 'https://qiita.com'

      DEFAULT_HEADERS = {
        "Accept" => "application/json"
      }

      def initialize(access_token: nil)
        @access_token = access_token
      end

      def default_headers
        headers = DEFAULT_HEADERS.clone
        headers["Authorization"] = "Bearer #{@access_token}" if @access_token
        headers
      end

      def get(url)
        httpclient = HTTPClient.new
        httpclient.get(url, default_headers)
      end

      def fetch_users
        path = '/api/v2/users'
        url = API_BASE_URL + path

        get(url)
      end

      def fetch_items
        path = '/api/v2/items'
        url = API_BASE_URL + path

        get(url)
      end

      def fetch_item_likes(item_id:)
        path = "/api/v2/items/#{item_id}/likes"
        url = API_BASE_URL + path

        get(url)
      end
    end
  end
end

