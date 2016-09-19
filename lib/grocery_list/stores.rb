require 'pry'

class GroceryList::Store
  attr_accessor :name, :url
  @@all = []

  def self.all
    @@all
  end

  def initialize(attributes)
    @name = attributes[:name]
    @url = attributes[:url]
    if @@all.all?{|x| x.name != attributes[:name]}
      @@all << self
    end
  end

  def self.scrape_stores
    stores = Nokogiri::HTML(open("http://jillcataldo.com/category/deals-of-the-week/")).css(".entry-title")
    stores.each do |store|
      individual_store = store.text.split
      if individual_store[0] == "Coupon" && individual_store[1] == "Matchups:"
        self.new({
          name: individual_store[2],
          url: store.css("a").attribute("href").value
        })
      end
    end
  end

end
