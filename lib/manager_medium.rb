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
      parsed_page = medium_parsed_page

      loop do
        article_number = select_article

        @title = parsed_page.css('section > div > div > div > h3')[article_number].text

        @author = parsed_page.css('section > div > div > div > div > div > a')[article_number].inner_html

        @url = parsed_page.css('section > div > div > div > h3')[article_number].inner_html
        @url = @url.split('href="')[1].split('?source=')[0]

        break unless @author.include? '<!--'
      end
    end

    private

    def select_topic
      %w[programming productivity relationships].sample
    end

    def select_article
      Random.rand(9)
    end

    def medium_parsed_page
      article_type = select_topic

      unparsed_page = HTTParty.get("https://medium.com/topic/#{article_type}")
      Nokogiri::HTML(unparsed_page.body)
    end
  end
end
