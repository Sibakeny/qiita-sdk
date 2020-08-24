module Qiita
  module Sdk
    class Client
      require 'net/https'
      require 'uri'
      require 'json'

      API_BASE_URL = 'https://qiita.com'

      DEFAULT_HEADERS = {
        "Accept" => "application/json",
        "Content-Type" => "application/json"
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

      def patch(url, params)
        httpclient = HTTPClient.new
        httpclient.patch(url, params.to_json, default_headers)
      end

      def post(url, params)
        httpclient = HTTPClient.new
        httpclient.post(url, params.to_json, default_headers)
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

      def delete_comment(comment_id:)
        path = "/api/v2/comments/#{comment_id}"
        url = API_BASE_URL + path

        delete(url)
      end

      def fetch_comment(comment_id:)
        path = "/api/v2/comments/#{comment_id}"
        url = API_BASE_URL + path

        get(url)
      end

      def update_comment(comment_id:, body:)
        path = "/api/v2/comments/#{comment_id}"
        url = API_BASE_URL + path

        params = {
          body: body
        }

        patch(url, params)
      end

      def fetch_item_comments(item_id:)
        path = "/api/v2/items/#{item_id}/comments"
        url = API_BASE_URL + path

        get(url)
      end

      def post_comment(item_id:, body:)
        path = "/api/v2/items/#{item_id}/comments"
        url = API_BASE_URL + path

        params = {
          body: body
        }

        post(url, params)
      end
    end
  end
end

