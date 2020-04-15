require 'open-uri'
require 'pry'

class Scraper

  def self.scrape_index_page(index_url)
    doc = Nokogiri::HTML(open(index_url))
    #Student
    #doc.css(".student-card")
    #Student URL
    #doc.css(".student-card a").map { |link| link['href'] }
    #Student Name
    #doc.css(".student-card .card-text-container h4").map {|name| name.text}
    #Student Location
    #doc.css(".student-card .card-text-container p").map {|location| location.text}
    students = []
    doc.css(".student-card").each do |student|
      student_card = {
        :name => student.css(".card-text-container h4").text,
        :location => student.css(".card-text-container p").text,
        :profile_url => student.css("a").attribute("href").value
      }
      students << student_card
    end
    students
    #binding.pry
  end

  def self.scrape_profile_page(profile_url)
    doc = Nokogiri::HTML(open(profile_url))
    #Twitter
    #doc.css(".social-icon-container a").attribute("href").value
    #linkedin
    doc.css(".social-icon-container a").second
    binding.pry
  end

end
