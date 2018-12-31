require_relative "./countrys"

class CLI
  attr_accessor :user

  def initialize(user)
    @user = user
  end
end


CLI.new("josh")
