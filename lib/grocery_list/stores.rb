require 'pry'
class GroceryList::Store
  attr_accessor :name, :url
  # @@all = []
  # def initialize(store_hash)
  #   @store = store_hash[:name]
  #   @url = store_hash[:url]
  #   @@all << self
  # end
  #
  # def self.all
  #   @@all
  #
  # end
  # @@all.each do |store|
  #   puts "#{store}"
  # end
  # binding.pry


  def self.get_links
    link = Nokogiri::HTML(open("http://jillcataldo.com/category/deals-of-the-week/"))
    the_stores = link.css(".entry-title")

  end
  def self.each_store
    each_store = self.get_links
    array = []
    # s = Hash.new
    the_store = nil

    each_store.each do |store|

      individual_store = store.text.split

      if individual_store[0] == "Coupon" && individual_store[1] == "Matchups:"
        the_store = self.new
        the_store.name = individual_store[2]
        # unless scrape_stores.include?(individual_store[2])
        # unless the_store.include?(individual_store[2])
        the_store.url = store.css("a").attribute("href").value
        # array << {:name => s[:name], :url => s[:url]}
      end
      check_array = array.all?{|x| x.name != the_store.name}

        if check_array
          array << the_store
        end

    end

    #   GroceryList::Store.new(value)
    # end
    array
    
  end

end
