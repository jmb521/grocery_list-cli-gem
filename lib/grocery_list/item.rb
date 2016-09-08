class GroceryList::Item
  attr_accessor :name, :price, :coupon, :quantity, :size
  #gets the name of the item, the price, the coupon associated with it, the amount of the coupon, and then the price after the coupon has been
  #applied
  # @@all = []
  # def initialize(item_hash)
  #   @name = item_hash[:name]
  #   @price = item_hash[:price]
  #   @coupon = item_hash[:coupon]
  #   @quantity = item_hash[:quantity]
  #   @size = item_hash[:size]
  #   @store = item_hash[:store]
  #   @@all <<self
  # end

#   def self.all
#     @@all

#   end
  # item_1 = self.new
  # item_1.name = "Oscar Meyer Bacon"
  # item_1.price = 4.99
  # item_1.coupon = ".50 off when you buy 2"
  # item_1.coupon_amount = 0.50
  # item_1.mimum_required_for_coupon = 2
  # item_1.total_price = 9.48


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
    new_item = nil
    scraped_item.each do |header, desc|
      #trying to figure out how to get the quantity data from the description when it is written as a word and not an integer string "four" vs "4"
      # split_header = header.split(/.?[0-9].?/)
      new_item = self.new

      new_item.name = header.match(/[a-zA-Z]+\s?\&?\s?[a-zA-Z]+[']?/)
      new_item.price = header.match(/[$\.\,][0-9]+/)

      split_desc = desc.split(/[\.]\W/)


      #  item_hash[:price] = header_price
       #
      #  item_hash[:name] = header_name

      split_desc.each do |each_desc|
        if each_desc.include?("oz") || each_desc.include?("ct") || each_desc.include?("qt") || each_desc.include?("pack")
        item_size = each_desc.match(/([0-9]+.?[0-9]?\-?[0-9]?+.?[0-9]?[oz]+|[0-9]+[ct]+|[0-9][pack]+|[0-9]+.?[0-9][qt]+)/)


          new_item.size = item_size

        elsif each_desc.include?("SS") || each_desc.include?("RP")
          new_item.coupon = each_desc
        elsif each_desc.include?("buy")
          num = each_desc.split(/(buy)\s/)
          split_num = num[2].split(" ")

          case split_num[0]
          when "one"
            new_item.quantity = 1
          when "two"
            new_item.quantity = 2
          when "three"
            new_item.quantity = 3
          when "four"
            new_item.quantity = 4
          when "five"
            new_item.quantity = 5
          when "six"
            new_item.quantity = 6
          when "seven"
            new_item.quantity = 7
          when "eight"
            new_item.quantity = 8
          when "nine"
            new_item.quantity = 9
          when "ten"
            new_item.quantity = 10
          when "eleven"
            new_item.quantity = 11
          when "twelve"
            new_item.quantity = 12
          else
            new_item.quantity = num[2]
          end #ends the case statement
        end #ends the if statement
      end #ends the split.desc loop
        # array << {:name => item_hash[:name], :price => item_hash[:price], :coupon => item_hash[:coupon], :quantity => item_hash[:quantity], :size => item_hash[:size]}
        array << new_item

    end #ends the scrape_items loop

    # array.each do |arr|
    #   GroceryList::Item.new(arr)
    #
    # end #ends the array loop

    array

  end#ends the def self.create_item method
end
