
class CLI
  attr_accessor :user

  def initialize(user)
    @user = user
  end

  def welcome
    puts "|Welcome to Country Holiday List|"
    puts "|-------------------------------|"
    puts "|Please enter the countrys code |"
    puts "|you want to know about.        |"
    puts "|-------------------------------|"
    puts "|or type 'list' to get a list   |"
    puts "|of countries.                  |"
    puts "|-------------------------------|"
    puts "|type 'exit' to end the program |"
    puts " "

    where_to?
  end

  def country_list

    puts "|------------------|"
    puts "| List of countries|::::::::::::::::::::::::::::::::::::::"
    puts "|------------------|"
    Country.all.each do |country|
      puts "| #{country.code}"
      puts "| #{country.name}"
      puts "| "
      puts "|-------------"
    end
    puts "|Please enter a county code|"
    puts "|--------------------------|"

    where_to?
  end

  def where_to?

    imput = gets.chomp.strip

    if imput == "list"
      country_list
    elsif imput == "exit"
      puts "thank you #{name}"
      puts "Exiting..."
      puts "Done"
    else
      puts " "
      country_info(imput)
    end
  end

  def country_info(country_code)
    Scraper.get_country_info.each do |country|
        if country[0] == country_code.upcase || country[0] == country_code
          puts " "
          puts "|::::::::::|::::::::::::::::::::::::::::::::::::::::::::::"
          puts "|Code:     | #{country[0]}"
          puts "|Country:  | #{country[1]}"
          puts "|__________|_________________"
          puts "|Do you want to see a list of|"
          puts "|holidays for this country?  |"
          puts "|            Y/N             |"
          imput = gets.chomp.strip
          if imput.upcase == "Y"
            puts Scraper.holiday(country[0])
          end
          puts "|Please enter a county code|"
          puts "|--------------------------|"

          where_to?
        end
      end
    end
  end
