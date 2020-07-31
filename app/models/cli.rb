require 'pry'
class CLI

    def start
        
        puts "\n"
        puts "\n"
        puts "\n"
        puts "     ad88888            88          88   ".blue
        sleep(0.1)                                                                      
        puts "     d8                             88                                                        ,d".blue
        sleep(0.2)               
        puts "     88                             88                                                        88".blue              
        sleep(0.3) 
        puts "   MM88MMM  8b,dPPYba,  88  ,adPPYb,88  ,adPPYb,d8  ,adPPYba, 88,dPYba,,adPYba,  ,adPPYYba, MM88MMM ,adPPYba, ".blue 
        sleep(0.4)
        puts  "    88     88P'    Y8  88 a8      Y88 a8      Y88 a8P_____88 88P     88      8a         Y8   88   a8P_____88 ".light_blue 
        sleep(0.5)
        puts  "    88     88          88 8b       88 8b       88 8PP        88      88      88 ,adPPPPP88   88   8PP         ".light_blue
        sleep(0.4)
        puts  "    88     88          88  8a,   ,d88  8a,   ,d88  8b,   ,aa 88      88      88 88,    ,88   88,   8b,   ,aa  ".cyan
        sleep(0.3)
        puts  "    88     88          88    8bbdP Y8    YbbdP Y8    Ybbd8   88      88      88   8bbdP Y8    Y888   Ybbd8    ".cyan
        sleep(0.2)
        puts  "                                       aa,    ,88                                                             ".light_cyan
        sleep(0.1)
        puts  "                                         Y8bbdP                                                              ".light_cyan
        sleep(0.1)
        puts "\n                                          Welcome to Fridgemate!\n".light_cyan
        puts "\n"
        sleep(0.7)
        create_new_roommate
    end

    def create_new_roommate
        puts "\n                                            What is your name?"
        name = gets.chomp
        puts "Thanks, #{name}, Give me a second to scan your biometrics"
        sleep(1.0)
        puts "\n ."
        puts "\n .."
        puts "\n ..."
        puts "\n ...."
        puts "\n ....."
        puts "\n ......"
        sleep(0.5)
        puts "\n ......."
        puts "\n ........"
        puts "\n .........."
        puts "\n ........... ALMOST DONE"
        sleep(1.0)
        puts "\n .........."
        puts "\n ........"
        puts "\n ......."
        puts "\n ......"
        puts "\n ....."
        sleep(0.5)
        puts "\n ...."
        sleep(0.4)
        puts "\n ..."
        sleep(0.3)
        puts "\n .."
        sleep(0.2)
        puts "\n ."
        sleep(0.1)
        puts "\n______________SCAN_COMPLETED__________________\n".green
        puts "                     Welcome, #{name}".yellow
        if Roommate.exists?(name: name)
            @new_roommate = Roommate.find_by(name: name)
            menu
        else
            puts "\nHmmmm I don't recognize your biometrics. You must be a new roommate. Welcome!"
            puts "I'll need to gather some data from you! I promise not to sell it to advertisers.\n"
            puts "Do you have any of these allergies, #{name}? (lactose intolerant, nut allergy, gluten free, or none?)"
            allergy = gets.chomp
            puts "\nWhat is your Grocery Budget?".green 
            puts "(Please enter a number 1-500)".light_green
            budget = gets.chomp
            @new_roommate = Roommate.create(name: name, allergy: allergy, budget: budget)
            puts "\n         Alrighty! You're all moved in!"
            puts "\n     Looks like you need to go grocery shopping!" 
            add_groceries
        end
    end

    def menu
    puts "          -----------------------------------------------\n"
    puts ""
    puts "          | What would you like to do with Fridgemate?  |\n"
    puts "\n          | Enter 1 to see your groceries               |\n"
    puts "          | Enter 2 to check the quantity of a grocery  |\n"
    puts "          | Enter 3 to toss a grocery                   |\n"
    puts "          | Enter 4 to eat a grocery                    |\n"
    puts "          | Enter 5 to add a grocery                    |\n"
    puts "          _______________________________________________\n"

    menu_choice = gets.chomp
    case menu_choice
        when "1"
            see_my_groceries
        when "2"
            quantity_check
        when "3"
            toss_grocery
        when "4"
            eat_grocery
        when "5"
            add_groceries
        else
            puts "Sorry that's not an option, try again".red
            sleep(0.5)
        menu
        end
    end



    def add_groceries
        puts "\n     What's the name of the grocery item you'd like to purchase?"
        grocery_name = gets.chomp
        puts "\nWow! #{grocery_name} sounds delicious!".light_yellow
        puts "\nwhat's the quality of this grocery (1-5)?
        \n1 being store brand \n
        5 being top shelf, highest quality out there \n
        "
        grocery_quality = gets.chomp
        puts "How much does/do #{grocery_name} cost rounded to the nearest dollar?"
        grocery_cost = gets.chomp
        puts "Does it contain any allergens? pick one: nuts, dairy, gluten, none"
        grocery_contains = gets.chomp
        added_grocery = Grocery.create(name: grocery_name, quantity: 4, contains: grocery_contains, quality: grocery_quality, cost: grocery_cost)
        Fridgemate.create(grocery_id: added_grocery.id, roommate_id: @new_roommate.id)
        puts "Enjoy your #{grocery_name}, #{@new_roommate.name}!"
        add_another_grocery
    end
    
    def add_another_grocery
        puts "\n Do you want to add some more? (y/n)"
        more_response = gets.chomp
        case more_response.downcase
        when "y"
            add_groceries
        when "yes"
            add_groceries
        when "n"
            menu
        when "no"
            menu
        else
            puts "Sorry that's not an option, try again".red
            add_another_grocery
        end
    end

    def eat_grocery
        puts "Which grocery item would you like to consume?"
        grocery_item = gets.chomp
        grocery_to_eat = Grocery.find_by(name: grocery_item)
        if !grocery_to_eat
            puts "Hey, sorry, I don't think that's a grocery in the fridgemate. Try again?".red
            sleep(0.5)
            eat_grocery
        else
            grocery_to_eat.update(quantity: grocery_to_eat.quantity - 1)
            puts "Would you like to eat another grocery? (y/n)"
            eat_another = gets.chomp
            case eat_another.downcase
                when "y"
                eat_grocery
                when "yes"
                eat_grocery
                else
                menu
            end
        end
    end

    def toss_grocery
        puts "Would you like to toss a grocery? (y/n)"
        toss_response = gets.chomp
        case toss_response.downcase 
        when "n"
        menu
        when "no"
            menu
        end
        case toss_response.downcase
        when "y"
            puts "Which grocery would you like to toss?"
            toss = gets.chomp
                toss_grocery_id = Grocery.where(name: toss).ids
                grocery_to_toss = Fridgemate.find_by(grocery_id: toss_grocery_id, roommate_id: @new_roommate.id)
                Fridgemate.delete(grocery_to_toss.id)
                puts "
    ___/-\___
   |---------|
    | | | | |
    | | | | |
    | | | | |
    | | | | |
    |_______|
                "
                sleep(0.5)
                puts "\nIt's outta hereeeee!".green
        else
                    puts "I can't toss that, because it doesn't exist ): Try again?".red
                    toss_grocery
        end
        menu
    end



    def quantity_check
        puts "Would you like to know how much of a grocery you have left? (y/n)"
            check_response = gets.chomp
            case check_response.downcase
            when "n"
                menu
            when "no"
                menu
            when "y"
                check_quantity
            else
                puts "Sorry that's not an option, try again".red
                quantity_check
            end
    end

    def check_quantity
        puts "Which grocery would you like to check?"
        grocery_item = gets.chomp
        grocery_to_check = Grocery.find_by(name: grocery_item)
        if !grocery_to_check
            puts "          Hey, sorry, I don't think that's a grocery in the fridgemate. Try again?".red
            check_quantity
        else
            amount = grocery_to_check.quantity
            if amount == 4
                puts "#{grocery_to_check.name} item is Full 100%\n".green
            elsif amount == 3
                puts "#{grocery_to_check.name} item is Almost Full 75%\n".light_green
            elsif amount == 2
                puts "#{grocery_to_check.name} item is Half Full 50%\n".yellow
            elsif amount == 1
                puts "#{grocery_to_check.name} item is Almost Gone %25 \n
                It would behoove you to buy some more".red
            end
            puts "Would you like to see another grocery? (y/n)".cyan
            check_another = gets.chomp
            case check_another
                when "y"
                check_quantity
                when "Y"
                check_quantity
            end
        end
    menu
    end

    def see_my_groceries
        puts "\n"
            Fridgemate.all.each do |fridgemate|
                if fridgemate.roommate_id == @new_roommate.id
                    x = fridgemate.grocery_id
                    @grocery = Grocery.all.find(x)
                    puts "\nGrocery Name:#{@grocery.name}\n Grcoery Quantity: #{@grocery.quantity}".light_blue  
                end
            end
            puts "Push the return/enter key to return to main menu"
            back = gets.chomp
        menu
    end 

     

end








