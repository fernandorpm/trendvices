require 'bitly'
require_relative '../config/bitly_auth'

module Trendvices
  class ManagerBitly
    def initialize
      @bitly_auth = BitlyAuth.new
    end

    def shorten_url(url)
      client = Bitly::API::Client.new(token: @bitly_auth.access_token)

      bitlink = client.shorten(long_url: url)

      bitlink.link
    end
  end
end
