require 'pry'
class GroceryList::Scraper
attr_accessor :store, :price, :final_price, :description, :coupon, :url
@@all = []

  def self.get_links
    link = Nokogiri::HTML(open("http://jillcataldo.com/category/deals-of-the-week/"))
    the_stores = link.css(".entry-title")

  end


  def self.each_store
    each_store = self.get_links
    array = []
    s = Hash.new
    each_store.each do |store|
      individual_store = store.text.split
      if individual_store[0] == "Coupon" && individual_store[1] == "Matchups:"
        s[:name] = individual_store[2] unless s.include?(individual_store[2])
        s[:url] = store.css("a").attribute("href").value
        array << {:name => s[:name], :url => s[:url]}
      end
    end
    array.each do |value|
      GroceryList::Store.new(value)
    end

    # end
    GroceryList::Store.all

    # GroceryList::Store.all.each do |store_url|
    #   store.url = self.get_links.css("a").attribute("href").value
    #   binding.pry
    # end
    #
    # GroceryList::Store.all
    #
    #   binding.pry


  end

  def self.scrape_jewel

    # doc = Nokogiri::HTML(open("http://jillcataldo.com/coupon-matchups-jewel-osco-deals-of-the-week-72016-72616/"))
    # header = doc.css(".mbd_divider_title").text
    # content = doc.css(".mbd_coupons_item_content").text
    # item_header = doc.css(".mbd_coupons_item_header").text
    # item_price = item_header.split(/(\$\d+.\d+)/)

  end
end
