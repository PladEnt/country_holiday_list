
class Country
  attr_accessor :code, :name, :holidays
  @@all = []

  def initialize(country_info)
    @code = country_info[0]
    @name = country_info[1]
    @holidays = []
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


end
