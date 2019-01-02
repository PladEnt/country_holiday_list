
class Country
  attr_accessor :code, :name, :holidays
  @@all = []

  def initialize(country_info)
    @code = country_info[0]
    @name = country_info[1]
    @holidays = {}
  end

  def self.all
    if @@all == []
      @@all = create_from_collection(Scraper.get_country_info)
    else
      @@all
    end
  end

  def self.create_from_collection(collection)
    collection.collect do |country_info|
      Country.new(country_info)
    end
  end

  def self.country_info(code)
  #this code shows the countrys info that you asked for

  error = "yes"

    @doc.css(".well-countries .col-xs-12").each do |country|

      if country.css("code").text.strip == code.upcase || country.css("a").text.strip == code
      #if you enter a countrys code like 'us' or a name like 'United States' this will run
        error = "no"
        puts " "
        puts "|::::::::::|::::::::::::::::::::::::::::::::::::::::::::::"
        puts "|Code:     | #{code}"
        puts "|Country:  | #{a}"
        puts "|__________|_________________"
        puts "|Do you want to see a list of|"
        puts "|holidays for this country?  |"
        puts "|            Y/N             |"

        imput = gets.chomp.strip
        if imput.upcase == "Y"

        end
      end
    end
  end
end
