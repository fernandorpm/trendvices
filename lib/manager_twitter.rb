require 'twitter'
require_relative '../config/twitter_auth'

module Trendvices
  class ManagerTwitter
    def initialize
      @twitter_auth = TwitterAuth.new
    end

    def tweet(title = nil, author = nil, url = nil)
      return nil if title.nil? || author.nil? || url.nil?

      client = Twitter::REST::Client.new do |config|
        config.consumer_key = @twitter_auth.api_key
        config.consumer_secret = @twitter_auth.api_secret_key
        config.access_token = @twitter_auth.access_token
        config.access_token_secret = @twitter_auth.access_token_secret
      end

      tweet_string = "Read: #{title} - by #{author}. #trendvices #{url}"
      client.update(tweet_string)

      tweet_string
    end
  end
end