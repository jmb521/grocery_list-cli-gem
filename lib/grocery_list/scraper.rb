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

  end
  # "http://jillcataldo.com/coupon-matchups-jewel-osco-deals-of-the-week-83116-9616/"
  def self.scrape_items
    #sub w/ store_url instead of hard coding once it works.
    #use url from each store to get scraped data.
    item_link = Nokogiri::HTML(open("http://jillcataldo.com/coupon-matchups-jewel-osco-deals-of-the-week-83116-9616/"))
    each_item = item_link.css(".mbd_coupons_item_content")

    # each_desc = item_link.css(".mbd_coupons_item_desc")
    item_array = []

    each_item.each do |item|

      item_header = item.css("div").children.text
      item_desc = item.css("label.mbd_coupons_item_desc").text
      if item_header.include?("$") || item_header.include?("Free") || item_header.include?(".")
        item_array << [item_header, item_desc]

      end

    end
    item_array

  end

  def self.create_item
    scraped_item = self.scrape_items
    scraped_item.each do |header, desc|
      
      binding.pry

    end

  end
end
