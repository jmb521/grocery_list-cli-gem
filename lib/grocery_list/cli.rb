require 'pry'
class GroceryList::CLI

  def call

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

    store = GroceryList::Store.all

  end

  def menu

    input = nil
    while input != "exit"
      #greets user and asks which store they want.
        puts "Which store would you like to check?"
        puts "Enter a number or type exit"
        store_list.each_with_index do |store_name, index|
          index +=1
          puts "#{index}. #{store_name.store}"
        end
        input = gets.strip
        # after the menu I want to be able to enter a number for which store to get data from
        # then it will scrape that store and give me a list of products
        case input
        when "1"
          puts "Here is the list of products for Meijer"
        when "2"
          puts "Here are the products for Jewel"
        when "3"
          puts "here are the products for Walmart"
        when "4"
          puts "here are the products for Kroger"
        when "5"
          puts "Here are the products for Target"
        when "list"
          store_list
        else
          puts "Please make a selection from the list or type exit"

        end

    end


  end

end
