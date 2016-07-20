require 'pry'
class GroceryList::Scraper
attr_accessor :store, :price, :final_price, :description, :coupon, :url
@@all = []

  def initialize(url, store)
    @url = url
    @store = store

  end


  def self.scrape(url)
    html = open(url)
    doc = Nokogiri::HTML(html)
    binding.pry

end
