module Qiita
  module Sdk
    class Client
      require 'net/https'
      require 'uri'
      require 'json'

      include Qiita::Sdk::ApiActions

      # @return [String]
      attr_accessor :access_token

      API_BASE_URL = 'https://qiita.com'.freeze

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
        headers = {
          'Accept' => 'application/json',
          'Content-Type' => 'application/json'
        }
        headers['Authorization'] = credential if credential
        headers
      end

      def get(path, params)
        url = endpoint + path
        httpclient = HTTPClient.new
        httpclient.get(url, params, headers)
      end

      def patch(path, params)
        url = endpoint + path
        httpclient = HTTPClient.new
        httpclient.patch(url, params.to_json, headers)
      end

      def put(path, params)
        url = endpoint + path
        httpclient = HTTPClient.new
        httpclient.put(url, params)
      end

      def post(path, params)
        url = endpoint + path
        httpclient = HTTPClient.new
        httpclient.post(url, params.to_json, headers)
      end

      def delete(path)
        url = endpoint + path
        httpclient = HTTPClient.new
        httpclient.delete(url)
      end

      def endpoint
        @endpoint ||= API_BASE_URL
      end
    end
  end
end
