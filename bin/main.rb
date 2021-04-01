#!/usr/bin/env ruby
require_relative '../lib/manager_bitly'
require_relative '../lib/manager_medium'
require_relative '../lib/manager_twitter'

module Trendvices
  md = ManagerMedium.new
  md.scrape

  bl = ManagerBitly.new
  bit_url = bl.shorten_url(md.url)

  tt = ManagerTwitter.new
  tt.tweet(md.title, md.author, bit_url)
end
