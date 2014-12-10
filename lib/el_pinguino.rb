require_relative 'el_pinguino/version'
require 'nokogiri'
require 'open-uri'
require 'json'

module ElPinguino

  class << self
    def number_of_pages (url)
      selector = "#paginator > div > div > ul > li:nth-last-child(2) > a"
      page_number = Nokogiri::HTML(open(url)).css(selector).text.to_i
      return page_number
    end

    def find_locations (**opts)
      city = opts.fetch(:city, nil)
      state = opts.fetch(:state, nil)
      country = opts.fetch(:country)
      location_url = "#{country}/#{state}/#{city}".gsub(' ','-').gsub('//','/')
      base_url = "http://www.travelmob.com/vacation-rentals/#{location_url}"

      options_url = ''
      opts.reject{ |k,v| [:city, :country, :pages].include?(k) }.each do |k,v|
        options_url << "&#{k}=#{v}"
      end

      unless opts.has_key?('pages')
        opts[:pages] = number_of_pages("#{base_url}?page=1#{options_url}")
      end
      results = []
      (opts.fetch(:pages) + 1).times do |pg|
        url = "#{base_url}?page=#{(pg + 1).to_s}#{options_url}"
        puts url
        Nokogiri::HTML(open(url)).css(".space.row").each do |box|
          name = box.css('h4').text
          city = box.css('[itemprop="addressRegion"]').text
          price = box.css('.price').text
          bedrooms = box.css('.bedrooms').text
          capacity = box.css('.accommodates').text
          output = {country:  country,
                    city:     city,
                    name:     name,
                    price:    price.to_i,
                    bedrooms: bedrooms.to_i,
                    capacity: capacity.to_i
          }.to_json
          results << output
        end
      end
      return results
    end
  end
end
