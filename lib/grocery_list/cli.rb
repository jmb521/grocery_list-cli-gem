require 'pry'
class GroceryList::CLI

  def call

    menu
  end

  def menu
    g_l = []
    puts "This is just a test"
    input = ""
    while input != "exit"

        puts "Which store would you like to check?"
        #HEREDOC
        puts <<-DOC
        1. Meijer
        2. Jewel
        3. Walmart
        4. Kroger
        5. Target
        DOC
        input = gets.strip

        puts "Gain with FreshLock Island Fresh Dryer Sheets 120 ct - $2.50"
        puts "$2.00/1 – Gain Liquid Laundry Detergent 40 oz, Fabric Enhancer 52 load or Dryer Sheets 120 ct or larger (coupons.com)"
        puts "Final Price is $0.50"




    end


  end

end
