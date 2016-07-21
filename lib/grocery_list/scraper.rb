require 'pry'
class GroceryList::Scraper
attr_accessor :store, :price, :final_price, :description, :coupon, :url
@@all = []

  def initialize(url, store)
    @url = url
    @store = store

  end


  def self.scrape_walmart

    doc = Nokogiri::HTML(open("http://jillcataldo.com/coupon-matchups-jewel-osco-deals-of-the-week-72016-72616/"))
    header = doc.css(".mbd_divider_title").text
    content = doc.css(".mbd_coupons_item_content").text

    binding.pry
  end
end
