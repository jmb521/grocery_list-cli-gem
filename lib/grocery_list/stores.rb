require 'pry'
class GroceryList::Store
  attr_accessor :store, :url
  @@all = []
  def initialize(store)
    @store = store
    @@all << self
  end

  def self.all
    @@all
    binding.pry
  end
end
