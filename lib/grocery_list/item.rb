class GroceryList::Item
  attr_accessor :name, :price, :coupon, :coupon_amount, :minimum_required_for_coupon, :quantity
  #gets the name of the item, the price, the coupon associated with it, the amount of the coupon, and then the price after the coupon has been
  #applied
  @@all = []
  def initialize(item_hash)
    @name = item_hash[:name]
    @price = item_hash[:price]
    @coupon = item_hash[:coupon]
    @coupon_amount = item_hash[:coupon_amount]
    @minimum_required_for_coupon = item_hash[:minimum_required_for_coupon]
    @quantity = item_hash[:quantity]
    @@all <<self
  end


  item_1 = self.new
  item_1.name = "Oscar Meyer Bacon"
  item_1.price = 4.99
  item_1.coupon = ".50 off when you buy 2"
  item_1.coupon_amount = 0.50
  item_1.mimum_required_for_coupon = 2
  item_1.total_price = 9.48

end
