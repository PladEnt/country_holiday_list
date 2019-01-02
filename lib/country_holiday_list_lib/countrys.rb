 require_relative "./scraper"

class Countrys
  attr_accessor :holidays, :doc, :code_of_all

  def initialize
    Scraper.new
    @doc = Scraper.doc
    @code_of_all = Scraper.code

  end

  def self.country_list
    info = Scraper.code
    puts "|------------------|"
    puts "| List of countries|::::::::::::::::::::::::::::::::::::::"
    puts "|------------------|"
    info.each do |code, name|
      puts "| #{code}"
      puts "| #{name}"
      puts "| "
      puts "|-------------"
    end
    puts "|Please enter a county code|"
    puts "|--------------------------|"


    puts @list_of_countries
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
        puts "|Code:     | #{country.css("code").text.strip}"
        puts "|Country:  | #{country.css("a").text.strip}"
        puts "|__________|_________________"
        puts "|Do you want to see a list of|"
        puts "|holidays for this country?  |"
        puts "|            Y/N             |"

        imput = gets.chomp.strip
        if imput.upcase == "Y"
          holiday_info(country.css("code").text.strip)
        end
      end
    end
  end
end
