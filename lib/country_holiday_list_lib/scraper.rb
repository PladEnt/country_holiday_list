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
      code = country.css("code").text.strip
      a = country.css("a").text.strip
      country = []
      country << code
      country << a
      codes << country
    end
    return codes
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
