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
    #this will be subbed out for scraped data

    puts <<-DOC
    1. Meijer
    2. Jewel
    3. Walmart
    4. Kroger
    5. Target
    DOC
  end

  def menu

    input = nil
    while input != "exit"
      #greets user and asks which store they want.
        puts "Which store would you like to check?"
        puts "Enter a number or type exit"
        store_list
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
          puts "You have made an invalid selection. Please select one of the following"

        end

    end


  end

end
