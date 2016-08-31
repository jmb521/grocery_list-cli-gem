class GroceryList::Item
  attr_accessor :name, :price, :coupon, :coupon_amount, :minimum_required_for_coupon, :total_price, :quantity
  #gets the name of the item, the price, the coupon associated with it, the amount of the coupon, and then the price after the coupon has been
  #applied
  @@all = []
  def initialize(name, price, coupon, coupon_amount, minimum_required_for_coupon = 1, total_price, quantity = 1)
    @name = name
    @price = price
    @coupon = coupon
    @coupon_amount = coupon_amount
    @minimum_required_for_coupon = minimum_required_for_coupon
    @total_price = total_price
    @quantity = quantity
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
