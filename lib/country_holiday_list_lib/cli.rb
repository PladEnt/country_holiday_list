require_relative "./countrys"

class CLI
  attr_accessor :user

  def initialize(user)
    Coutrys.new
    @user = user
  end

  def self.welcome
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

    self.where_to?
  end

  def self.where_to?

    imput = gets.chomp.strip

    if imput == "list"
      Countrys.country_list
    elsif imput == "exit"
      puts "Exiting..."
    else
      puts " "
      Countrys.country_info(imput)
    end
  end
end


CLI.new("josh")
CLI.welcome
