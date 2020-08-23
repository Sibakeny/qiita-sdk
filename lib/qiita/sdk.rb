require "qiita/sdk/version"
require 'qiita/sdk/client'

module Qiita
  module Sdk
    class Error < StandardError; end
    def self.greet
      p "hello"
    end
  end
end
