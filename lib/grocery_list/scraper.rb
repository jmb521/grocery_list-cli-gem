require 'pry'
class GroceryList::Scraper
attr_accessor :store, :price, :final_price, :description, :coupon, :url
@@all = []

  def self.get_links
    link = Nokogiri::HTML(open("http://jillcataldo.com/category/deals-of-the-week/"))
  end

  def self.get_stores
    self.get_links.css(".entry-title")

  end
  def self.each_store
    self.get_stores.each do |store|
      store = GroceryList::Store.new

      atext = self.get_links.css("a").text
      a = self.get_links.css("a")
      get_name = atext.split(" ")
      store.store = get_name[2]
      store.url = self.get_links.css("a").attribute("href").value
      

    end
  end

  def self.scrape_jewel

    # doc = Nokogiri::HTML(open("http://jillcataldo.com/coupon-matchups-jewel-osco-deals-of-the-week-72016-72616/"))
    # header = doc.css(".mbd_divider_title").text
    # content = doc.css(".mbd_coupons_item_content").text
    # item_header = doc.css(".mbd_coupons_item_header").text
    # item_price = item_header.split(/(\$\d+.\d+)/)

  end
end
