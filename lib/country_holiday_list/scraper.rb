require "nokogiri"
require "open-uri"

doc = Nokogiri::HTML(open("https://www.calendarindex.com/"))
year = Time.new.year

def holiday_info(code)

  doc = Nokogiri::HTML(open("https://www.calendarindex.com/holidays/#{@year}/#{code}"))
  doc.css("tr").collect do |holiday|


  end
