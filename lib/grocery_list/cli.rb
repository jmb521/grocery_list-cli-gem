require 'pry'
class GroceryList::CLI

  def call
    store_list
    menu
  end

  # input = nil
  # while input != "exit"
  #   input = gets.strip
  #
  #   puts "Gain with FreshLock Island Fresh Dryer Sheets 120 ct - $2.50"
  #   puts "$2.00/1 – Gain Liquid Laundry Detergent 40 oz, Fabric Enhancer 52 load or Dryer Sheets 120 ct or larger (coupons.com)"
  #   puts "Final Price is $0.50"
  #
  # end
  def store_list
    GroceryList::Store.scrape_stores
    @stores = GroceryList::Store.all
    @stores.each_with_index do |store, index|
      index +=1
      puts "#{index}. #{store.name}"
    end

  end

  def menu


    input = nil
    while input != "exit"
      #greets user and asks which store they want.
        puts "Which store would you like to check?"
        puts "Enter a number, type list for the Stores available or type exit"
        input = gets.strip
        # after the menu I want to be able to enter a number for which store to get data from
        # then it will scrape that store and give me a list of products
        case input
        when "1"
          puts "Here is the list of products for #{@stores[0].name}"
          item_list(@stores[0])


        when "2"
          puts "Here is the list of products for #{@stores[1].name}"
          # GroceryList::Item.scrape_items(@stores[1].url)
          item_list(@stores[1])
        when "3"
          puts "Here is the list of products for #{@stores[2].name}"
          # GroceryList::Item.scrape_items(@stores[2].url)
          item_list(@stores[2])
        when "4"
          puts "Here is the list of products for #{@stores[3].name}"
          item_list(@stores[3])
        when "5"
          puts "Here is the list of products for #{@stores[4].name}"
          # GroceryList::Item.scrape_items(@stores[4].url)
          item_list(@stores[4])
        when "list"
          store_list
        # else
        #   puts "Please make a selection from the list or type exit"

        end
    end
  end
  def item_list(store_obj)
    GroceryList::Item.scrape_items(store_obj)
    @item = GroceryList::Item.all
    @item.each do |x|
       puts "Product: #{x.name}"
       puts "Size: #{x.size}"
       puts "Price: #{x.price}"
       puts "Coupon: #{x.coupon}"
       
       puts " ___________________________________
       \n"

    end
  end
end
