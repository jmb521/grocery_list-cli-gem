class GroceryList::Item
 attr_accessor :name, :price, :coupon, :size, :quantity
#  #gets the name of the item, the price, the coupon associated with it, the amount of the coupon, and then the price after the coupon has been
#  #applied
 @@all = []

 def initialize(attributes)
   @name = attributes[:name]
   @price = attributes[:price]
   @coupon = attributes[:coupon]
   @size = attributes[:size]
   @quantity = attributes[:quantity]
   @store = attributes[:store]
   @@all << self
 end

 def self.all
   @@all
 end

 def self.scrape_items(store_obj)
   item = self.new({store: store_obj, name: " ", price: " ", size: " ", coupon: " ", quantity: " "})

   item_link = Nokogiri::HTML(open(store_obj.url)).css(".mbd_coupons_item_content")
      # item_array = []

   item_link.each do |items|

     item_header = items.css("div").children.text
     item_desc = items.css("label.mbd_coupons_item_desc").text
     if item_header.include?("$") || item_header.include?("Free") || item_header.include?(".")
       item.name = item_header.match(/(\b[0-9\-]*?[a-zA-Z\-']++\s?(.*))/)
       item.price = item_header.match(/[$\.\,][0-9]+/)
     end
     if item_desc.include?("oz") || item_desc.include?("ct") || item_desc.include?("qt") || item_desc.include?("pack")
        item.size = item_desc.match(/([0-9]+.?[0-9]?\-?[0-9]?+.?[0-9]?[oz]+|[0-9]+[ct]+|[0-9][pack]+|[0-9]+.?[0-9][qt]+)/)
     end
     if item_desc.include?("buy")
            num = item_desc.split(/(buy)\s/)
            split_num = num[2].split(" ")
            case split_num[0]
            when "one", "1"
              item.quantity = 1
            when "two", "2"
              item.quantity = 2
            when "three", "3"
              item.quantity = 3
            when "four", "4"
              item.quantity = 4
            when "five", "5"
              item.quantity = 5
            when "six", "6"
              item.quantity = 6
            when "seven", "7"
              item.quantity = 7
            when "eight", "8"
              item.quantity = 8
            when "nine", "9"
              item.quantity = 9
            when "ten", "10"
              item.quantity = 10
            when "eleven", "11"
              item.quantity = 11
            when "twelve", "12"
              item.quantity = 12
            else
              item.quantity = 1
            end #ends the case statement
            item.quantity
          end #if statement
   end

 end
#
 # def self.create_item(store_url)
 #     self.scrape_items(store_url).each do |header, desc|
 #
 #          item_name = header.match(/(\b[0-9\-]*?[a-zA-Z\-']++\s?(.*))/)
 #          item_price = header.match(/[$\.\,][0-9]+/)
 #     desc.split(/[\.]\W/).each do |each_desc|
 #       if each_desc.include?("oz") || each_desc.include?("ct") || each_desc.include?("qt") || each_desc.include?("pack")
 #         item_size = each_desc.match(/([0-9]+.?[0-9]?\-?[0-9]?+.?[0-9]?[oz]+|[0-9]+[ct]+|[0-9][pack]+|[0-9]+.?[0-9][qt]+)/)
 #
 #       end
 #       if each_desc.include?("SS") || each_desc.include?("RP")
 #           item_coupon = each_desc
 #         else
 #           item_coupon = "Sale only - no coupon available"
 #       end
 #       if each_desc.include?("buy")
 #         num = each_desc.split(/(buy)\s/)
 #         split_num = num[2].split(" ")
 #         case split_num[0]
 #         when "one", "1"
 #           item_quantity = 1
 #         when "two", "2"
 #           item_quantity = 2
 #         when "three", "3"
 #           item_quantity = 3
 #         when "four", "4"
 #           item_quantity = 4
 #         when "five", "5"
 #           item_quantity = 5
 #         when "six", "6"
 #           item_quantity = 6
 #         when "seven", "7"
 #           item_quantity = 7
 #         when "eight", "8"
 #           item_quantity = 8
 #         when "nine", "9"
 #           item_quantity = 9
 #         when "ten", "10"
 #           item_quantity = 10
 #         when "eleven", "11"
 #           item_quantity = 11
 #         when "twelve", "12"
 #           item_quantity = 12
 #         else
 #           item_quantity = 1
 #         end #ends the case statement
 #         item_quantity
 #       end #if statement
 #
 #
 #       item = self.new({name: item_name, price: item_price,coupon: item_coupon, size: item_size, quantity: item_quantity})
 #
 #    end #ends the split.desc loop
 #
 #   end #ends the scrape_items loop
 #   self.all
 #   binding.pry
 # end#ends the def self.create_item method
end
