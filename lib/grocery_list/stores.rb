require 'pry'
class GroceryList::Store
  attr_accessor :store, :url
  @@all = []
  def initialize(store_hash)
    @store = store_hash[:name]
    @url = store_hash[:url]
    @@all << self
  end

  def self.all
    @@all
    binding.pry
  end
end
