
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

  def where_to?

    imput = gets.chomp.strip

    if imput == "list"
      country_list
    elsif imput == "exit"
      puts " "
      puts "thank you #{@user}"
      puts " "
      puts "Exiting..."
      puts "Done"
      exit
    else
      puts " "
      country_info(imput)
    end
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

  def country_info(country_code)
    error = "yes"
    Country.all.each do |country|
      if country.code == country_code.upcase || country.name == country_code
        error == "no"
        puts " "
        puts "|::::::::::|::::::::::::::::::::::::::::::::::::::::::::::"
        puts "|Code:     | #{country.code}"
        puts "|Country:  | #{country.name}"
        puts "|__________|_________________"
        puts "|Do you want to see a list of|"
        puts "|holidays for this country?  |"
        puts "|            Y/N             |"
        imput = gets.chomp.strip
        if imput.upcase == "Y"
          puts country.holidays
        end
        puts "|Please enter a county code|"
        puts "|--------------------------|"

        where_to?
      end
    end
    if error == "yes"
      puts " "
      puts " --------------"
      puts "| invaled code |"
      puts "|--------------------------"
      puts "|Please enter a county code|"
      puts "|--------------------------|"

      where_to?
    end
  end
end
