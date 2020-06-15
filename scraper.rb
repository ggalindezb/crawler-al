# frozen_string_literal: true

require 'httparty'
require 'openssl'
require 'nokogiri'
require 'open-uri'
require 'pry'

class Scraper
  class << self
    BASE_URL = 'http://localhost:3000/'
    def crawl(search_term)
      payload = query('admin/verify')
      document = Nokogiri::HTML(payload)

      qr_code = query('admin/mfa_qr')

      # result_set = document.css('.listingResult')
      # headlines = result_set.css('.article-link>.search-result>.content>header>h3')
      # text = headlines.map(&:text)
    end

    private

    def query(resource)
      HTTParty.get(BASE_URL + resource, basic_auth: { username: 'raging', password: 'tortoise' })
    end
  end
end

Scraper.crawl('amd threadripper')
