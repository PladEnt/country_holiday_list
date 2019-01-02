require "nokogiri"
require "open-uri"
require "pry"


class Scraper
  attr_accessor :doc

  def initialize
    @doc = Nokogiri::HTML(open("https://www.calendarindex.com/"))
  end

  def self.doc
    @doc
  end

  def self.code
    codes = []
    @doc.css(".well-countries .col-xs-12").each do |country|
      country = []
      country << country.css("code").text.strip
      country << country.css("a").text.strip
      countrys_info << country
    end
    return countrys_info
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
