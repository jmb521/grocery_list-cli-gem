class GroceryList::Item
  attr_accessor :name, :price, :coupon, :quantity, :size
  #gets the name of the item, the price, the coupon associated with it, the amount of the coupon, and then the price after the coupon has been
  #applied


# "http://jillcataldo.com/coupon-matchups-jewel-osco-deals-of-the-week-9716-91316/"
  def self.scrape_items(store_url)

    #need to figure out how to get store name in the item hash.
  #  when calling the scrape_items in the cli, pass in the store name and url.
    #sub w/ store_url instead of hard coding once it works.
    #use url from each store to get scraped data.
    item_link = Nokogiri::HTML(open(store_url))
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

  def self.create_item(store_url)
    scraped_item = self.scrape_items(store_url)
    # item_hash = Hash.new
    array = []

    scraped_item.each do |header, desc|
      #trying to figure out how to get the quantity data from the description when it is written as a word and not an integer string "four" vs "4"
      # split_header = header.split(/.?[0-9].?/)
      new_item = self.new
      new_item.name = header.match(/(\b[0-9\-]*?[a-zA-Z\-']++\s?(.*))/)
      # new_item.name = header.match(/[0-9]?[a-zA-Z,&'-]+\s?/)
      new_item.price = header.match(/[$\.\,][0-9]+/)
      split_desc = desc.split(/[\.]\W/)
      split_desc.each do |each_desc|

        if each_desc.include?("oz") || each_desc.include?("ct") || each_desc.include?("qt") || each_desc.include?("pack")
        item_size = each_desc.match(/([0-9]+.?[0-9]?\-?[0-9]?+.?[0-9]?[oz]+|[0-9]+[ct]+|[0-9][pack]+|[0-9]+.?[0-9][qt]+)/)
          new_item.size = item_size
        elsif each_desc.include?("buy")
          num = each_desc.split(/(buy)\s/)
          split_num = num[2].split(" ")
          case split_num[0]
          when "one", "1"
            item_quantity = 1
          when "two", "2"
            item_quantity = 2
          when "three", "3"
            item_quantity = 3
          when "four", "4"
            item_quantity = 4
          when "five", "5"
            item_quantity = 5
          when "six", "6"
            item_quantity = 6
          when "seven", "7"
            item_quantity = 7
          when "eight", "8"
            item_quantity = 8
          when "nine", "9"
            item_quantity = 9
          when "ten", "10"
            item_quantity = 10
          when "eleven", "11"
            item_quantity = 11
          when "twelve", "12"
            item_quantity = 12
          else
            item_quantity = 1
          end #ends the case statement
          new_item.quantity = item_quantity
          binding.pry
        elsif each_desc.include?("SS") || each_desc.include?("RP")
            new_item.coupon = each_desc
        else
          new_item.coupon = "Sale only - no coupon available"
          new_item.quantity = 1

          end
        #ends the if statement


      end #ends the split.desc loop
        array << new_item
    end #ends the scrape_items loop
    array
  end#ends the def self.create_item method
end
