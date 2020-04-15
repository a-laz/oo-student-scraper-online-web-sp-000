require 'open-uri'
require 'pry'

class Scraper

  def self.scrape_index_page(index_url)
    doc = Nokogiri::HTML(open(index_url))
    #Student URL
    doc.css(".student-card a").map { |link| link['href'] }
    #Student Name
    doc.css(".student-card .card-text-container h4").map {|name| name.text}
    #Student Location

    binding.pry
  end

  def self.scrape_profile_page(profile_url)

  end

end
