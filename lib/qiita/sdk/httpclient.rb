module Qiita
  module Sdk
    class HTTPClient
      require 'net/https'
      require 'uri'
      require 'json'

      # 'https://qiita.com/api/v2/users'
      def net_http(uri)
        http = Net::HTTP.new(uri.host, uri.port)
        http.use_ssl = true
        http.verify_mode = OpenSSL::SSL::VERIFY_NONE
        http
      end

      def get(url, params = {}, header = {})
        uri = URI.parse(url)
        query = URI.encode_www_form(params)
        uri.query = query

        net_http(uri).get(uri.request_uri, header)
      end

      def post(url, params, header = {})
        uri = URI.parse(url)
        net_http(uri).post(uri.request_uri, params, header)
      end

      def delete(url, header = {})
        uri = URI.parse(url)
        net_http(uri).delete(uri.request_uri, header)
      end

      def patch(url, params, header = {})
        uri = URI.parse(url)
        net_http(uri).patch(uri.request_uri, params, header)
      end

      def put(url, params, header = {})
        uri = URI.parse(url)
        net_http(uri).put(uri.request_uri, params, header)
      end
    end
  end
end
