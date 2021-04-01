require 'httparty'
require 'nokogiri'

module Trendvices
  class ManagerMedium
    attr_reader :title, :author, :url

    def initialize
      @title = ''
      @author = ''
      @url = ''
    end

    def scrape
      article_type = %w[programming productivity relationships].sample

      unparsed_page = HTTParty.get("https://medium.com/topic/#{article_type}")
      parsed_page ||= Nokogiri::HTML(unparsed_page.body)

      loop do
        article_number = Random.rand(9)

        @title = parsed_page.css('section > div > div > div > h3')[article_number].text

        @author = parsed_page.css('section > div > div > div > div > div > a')[article_number].inner_html

        @url = parsed_page.css('section > div > div > div > h3')[article_number].inner_html
        @url = @url.split('href="')[1].split('?source=')[0]

        break unless @author.include? '<!--'
      end
    end
  end
end
