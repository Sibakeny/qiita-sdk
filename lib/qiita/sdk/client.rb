module Qiita
  module Sdk
    class Client
      require 'net/https'
      require 'uri'
      require 'json'

      include Qiita::Sdk::ApiActions

      # @return [String]
      attr_accessor :access_token, :endpoint

      API_BASE_URL = 'https://qiita.com'

      DEFAULT_HEADERS = {
        "Accept" => "application/json",
        "Content-Type" => "application/json"
      }

      def initialize(options = {})
        options.each do |key, value|
          instance_variable_set("@#{key}", value)
        end
        yield(self) if block_given?
      end

      def credential
        "Bearer #{@access_token}" if @access_token
      end

      def headers
        headers = DEFAULT_HEADERS.clone
        headers["Authorization"] = credential if credential
        headers
      end

      def get(path)
        url = endpoint + path
        httpclient = HTTPClient.new
        httpclient.get(url, headers)
      end

      def patch(path, params)
        url = endpoint + path
        httpclient = HTTPClient.new
        httpclient.patch(url, params.to_json, headers)
      end

      def put(path)
        url = endpoint + path
        httpclient = HTTPClient.new
        httpclient.put(url)
      end

      def post(path, params)
        url = endpoint + path
        httpclient = HTTPClient.new
        httpclient.post(url, params.to_json, headers)
      end

      def delete(path)
        url = endpoint + path
        httpclient = HTTPClient.new
        httpclient.delete(path)
      end

      def endpoint
        @endpoint ||= API_BASE_URL
      end
    end
  end
end
