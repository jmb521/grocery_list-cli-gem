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
    @store = GroceryList::Store.each_store
    @store.each_with_index do |store, index|
      index +=1
      puts "#{index}. #{store.name}"
    end

  end

  def menu


    input = nil
    while input != "exit"
      #greets user and asks which store they want.
        puts "Which store would you like to check?"
        puts "Enter a number or type exit"
        input = gets.strip
        # after the menu I want to be able to enter a number for which store to get data from
        # then it will scrape that store and give me a list of products
        case input
        when "1"
          puts "Here is the list of products for #{@store[0].name}"
          GroceryList::Item.scrape_items(@store[0].url)
        when "2"
          puts "Here is the list of products for #{@store[1].name}"
          GroceryList::Item.scrape_items(@store[1].url)
        when "3"
          puts "Here is the list of products for #{@store[2].name}"
          GroceryList::Item.scrape_items(@store[2].url)
        when "4"
          puts "Here is the list of products for #{@store[3].name}"
          GroceryList::Item.scrape_items(@store[3].url)
        when "5"
          puts "Here is the list of products for #{@store[4].name}"
          GroceryList::Item.scrape_items(@store[4].url)
        when "list"
          store_list
        else
          puts "Please make a selection from the list or type exit"

        end

    end


  end

end
