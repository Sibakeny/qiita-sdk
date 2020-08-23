require "qiita/sdk/version"

module Qiita
  module Sdk
    class Error < StandardError; end
    def self.greet
      p "hello"
    end
  end
end
