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
    item_hash = Hash.new
    array = []
    scraped_item.each do |header, desc|
      #trying to figure out how to get the quantity data from the description when it is written as a word and not an integer string "four" vs "4"
      split_header = header.split(" ")
      split_desc = desc.split(/[\.]\W/)

       item_hash[:price] = split_header[0]
       item_hash[:name] = split_header[1]
      split_desc.each do |each_desc|
        if each_desc.include?("oz") || each_desc.include?("ct") || each_desc.include?("qt") || each_desc.include?("pack")
          item_hash[:size] = each_desc

        elsif each_desc.include?("SS") || each_desc.include?("RP")
          item_hash[:coupon] = each_desc
        elsif each_desc.include?("buy")
          num = each_desc.split(/(buy)\s/)
          case num[2]
          when "one"
            item_hash[:quantity] = 1
          when "two"
            item_hash[:quantity] = 2
          when "three"
            item_hash[:quantity] = 3
          when "four"
            item_hash[:quantity] = 4
          when "five"
            item_hash[:quantity] = 5
          when "six"
            item_hash[:quantity] = 6
          when "seven"
            item_hash[:quantity] = 7
          when "eight"
            item_hash[:quantity] = 8
          when "nine"
            item_hash[:quantity] = 9
          when "ten"
            item_hash[:quantity] = 10
          when "eleven"
            item_hash[:quantity] = 11
          when "twelve"
            item_hash[:quantity] = 12
          else
            item_hash[:quantity] = num[2]
          end
          binding.pry
        end
        

      end
      # array << {:name => item[:name], :url => s[:url]}
# attr_accessor :name, :price, :coupon, :quantity, :size

    end

  end
end
