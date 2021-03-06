require "nokogiri"
require "open-uri"
require "pry"


class Scraper

  def self.doc
    @@doc ||= Nokogiri::HTML(open("https://www.calendarindex.com/"))
  end

  def self.get_country_info
    countrys_info = []
    doc.css(".well-countries .col-xs-12").each do |country|
      country_info = []
      country_info << country.css("code").text.strip
      country_info << country.css("a").text.strip
      countrys_info << country_info
    end
    return countrys_info
  end

  def self.holidays(code)
    year = Time.new.year
    doc = Nokogiri::HTML(open("https://www.calendarindex.com/holidays/#{year}/#{code}"))


    doc.css("tr").collect do |info|

      "#{info.text.strip}\n\n"
    end

  end
end
