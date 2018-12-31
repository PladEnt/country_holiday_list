require_relative "./countrys"

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

    else
      puts " "
      country_info(imput)
    end
  end
end


CLI.new("josh")
CLI.welcome
