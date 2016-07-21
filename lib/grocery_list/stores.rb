require 'pry'
class GroceryList::Store
  attr_accessor :store, :url
  @@all = []
  def initialize
    @@all << self
  end

  def self.all
    @@all
  end
end
