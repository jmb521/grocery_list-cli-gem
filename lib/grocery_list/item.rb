class GroceryList::Item
  attr_accessor :name, :price, :coupon, :quantity, :size, :store
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
# binding.pry
#   end
  # item_1 = self.new
  # item_1.name = "Oscar Meyer Bacon"
  # item_1.price = 4.99
  # item_1.coupon = ".50 off when you buy 2"
  # item_1.coupon_amount = 0.50
  # item_1.mimum_required_for_coupon = 2
  # item_1.total_price = 9.48



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

  def self.create_item
    scraped_item = self.scrape_items
    # item_hash = Hash.new
    array = []
    scraped_item.each do |header, desc|
      #trying to figure out how to get the quantity data from the description when it is written as a word and not an integer string "four" vs "4"
      # split_header = header.split(/.?[0-9].?/)
      header_name = header.match(/[a-zA-Z]+\s?\&?\s?[a-zA-Z]+[']?/)

      header_price = header.match(/[$\.\,][0-9]+/)

      split_desc = desc.split(/[\.]\W/)


       item_hash[:price] = header_price

       item_hash[:name] = header_name

      split_desc.each do |each_desc|
        if each_desc.include?("oz") || each_desc.include?("ct") || each_desc.include?("qt") || each_desc.include?("pack")
        item_size = each_desc.match(/([0-9]+.?[0-9]?\-?[0-9]?+.?[0-9]?[oz]+|[0-9]+[ct]+|[0-9][pack]+|[0-9]+.?[0-9][qt]+)/)


          item_hash[:size] = item_size

        elsif each_desc.include?("SS") || each_desc.include?("RP")
          item_hash[:coupon] = each_desc
        elsif each_desc.include?("buy")
          num = each_desc.split(/(buy)\s/)
          split_num = num[2].split(" ")

          case split_num[0]
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
          end #ends the case statement
        end #ends the if statement
      end #ends the split.desc loop
        array << {:name => item_hash[:name], :price => item_hash[:price], :coupon => item_hash[:coupon], :quantity => item_hash[:quantity], :size => item_hash[:size]}
    end #ends the scrape_items loop

    array.each do |arr|
      GroceryList::Item.new(arr)

    end #ends the array loop
    binding.pry

  end#ends the def self.create_item method
end
