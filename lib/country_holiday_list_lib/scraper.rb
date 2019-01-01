require "nokogiri"
require "open-uri"
require "pry"


class Scraper
  @@doc = Nokogiri::HTML(open("https://www.calendarindex.com/"))
  def self.doc
    @@doc
  end

  def self.code
    @@doc.css(".well-countries .col-xs-12").each do |country|
      country.css("code").text.strip
      country.css("a").text.strip
    end
    return code
    return a
  end

  def self.holiday(code)
    year = Time.new.year

    doc = Nokogiri::HTML(open("https://www.calendarindex.com/holidays/#{year}/#{code}"))
    holiday_hash = {}

    doc.css("tr").collect do |info|

      holiday_hash << info.split("/a")
    # holiday_hash ={
    #   :name => info[0]
    #   :day => info[1]
    #   :date => info[2]
    #   :type => info[3]
    # }
    end
  end
end
