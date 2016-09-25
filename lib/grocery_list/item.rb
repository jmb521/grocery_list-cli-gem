class GroceryList::Item
 attr_accessor :name, :price, :coupon, :size
#  #gets the name of the item, the price, the coupon associated with it, the amount of the coupon, and then the price after the coupon has been
#  #applied
 @@all = []

 def initialize(attributes)
   @name = attributes[:name]
   @price = attributes[:price]
   @coupon = attributes[:coupon]
   @size = attributes[:size]

   @@all << self
 end

 def self.all
   @@all
 end

 def self.scrape_items(store_obj)
   item_link = Nokogiri::HTML(open(store_obj.url)).css(".mbd_coupons_item_content")

   item_link.each do |items|

     item_header = items.css("div").children.text
     item_desc = items.css("label.mbd_coupons_item_desc").text
     if item_header.include?("$") || item_header.include?("Free") || item_header.include?(".")
       item_name = item_header.match(/(\b[0-9\-]*?[a-zA-Z\-']++\s?(.*))/)
       item_price = item_header.match(/[$\.\,][0-9]+/)
     end
     if item_desc.include?("oz") || item_desc.include?("ct") || item_desc.include?("qt") || item_desc.include?("pack")
        item_size = item_desc.match(/([0-9]+.?[0-9]?\-?[0-9]?+.?[0-9]?[oz]+|[0-9]+[ct]+|[0-9][pack]+|[0-9]+.?[0-9][qt]+)/)
     end
     if item_desc.include?("SS") || item_desc.include?("RP")
        item_coupon = item_desc

     else
        item_coupon = "Sale only - no coupon available"

     end

    item = self.new({ name: item_name, price: item_price, size: item_size, coupon: item_coupon})

   end
 end
end
