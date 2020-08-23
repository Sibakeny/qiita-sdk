module Qiita
  module Sdk
    class Client
      require 'net/https'
      require 'uri'
      require 'json'

      def initialize(access_token: nil)
        @access_token = access_token
      end

      def get_list
        uri = URI.parse('https://qiita.com/api/v2/users')
        http = Net::HTTP.new(uri.host, uri.port)

        http.use_ssl = true
        http.verify_mode = OpenSSL::SSL::VERIFY_NONE

        req = Net::HTTP::Get.new(uri.request_uri)

        res = http.request(req)
        puts res.code, res.msg
        api_response = JSON.parse(res.body)
        p api_response
      end

    end
  end
end

