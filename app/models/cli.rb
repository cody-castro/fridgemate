require 'pry'
class CLI



def start


    
    puts "  ad88888            88          88   ".blue                                                                      
    puts "  d8                             88                                                        ,d".light_blue               
    puts "  88                             88                                                        88".cyan               
    puts " MM88MMM  8b,dPPYba, 88  ,adPPYb,88  ,adPPYb,d8  ,adPPYba, 88,dPYba,,adPYba,  ,adPPYYba, MM88MMM ,adPPYba, ".light_cyan 
    puts  "  88     88P'    Y8  88 a8      Y88 a8      Y88 a8P_____88 88P     88      8a         Y8   88   a8P_____88 ".blue 
    puts  "  88     88          88 8b       88 8b       88 8PP        88      88      88 ,adPPPPP88   88   8PP         ".light_blue
    puts  "  88     88          88  8a,   ,d88  8a,   ,d88  8b,   ,aa 88      88      88 88,    ,88   88,   8b,   ,aa  ".cyan
    puts  "  88     88          88    8bbdP Y8    YbbdP Y8    Ybbd8   88      88      88   8bbdP Y8    Y888   Ybbd8    ".light_cyan
    puts  "                                   aa,    ,88                                                             ".blue
    puts  "                                     Y8bbdP                                                              ".light_blue
    puts "\n                                        Welcome to Fridgemate!\n".light_cyan
    create_new_roommate
end

def create_new_roommate
    puts "\n                                  I see we have a new Roommate, what is your name?"
    name = gets.chomp
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

def add_groceries
    puts "\n     What's the name of the grocery item you'd like to purchase?"
    grocery_name = gets.chomp
    puts "Wow! #{grocery_name} sounds delicious!".light_yellow
    puts "what's the quality of this grocery (1-5)?
    \n1 being store brand \n
    5 being top shelf, highest quality out there \n
    "
    grocery_quality = gets.chomp
    puts "How much does/do #{grocery_name} cost rounded to the nearest dollar?"
    grocery_cost = gets.chomp
    puts "Does it contain any allergens? pick one: nuts, dairy, gluten"
    grocery_contains = gets.chomp
    added_grocery = Grocery.create(name: grocery_name, quantity: 4, contains: grocery_contains, quality: grocery_quality, cost: grocery_cost)
    Fridgemate.create(grocery_id: added_grocery.id, roommate_id: @new_roommate.id)
    puts "Enjoy your #{grocery_name}, #{@new_roommate.name}!"
    puts "\n Do you want to add some more? (y/n)"
    more_response = gets.chomp
    case more_response.downcase
    when "y"
        add_groceries
    when "yes"
        add_groceries
    end
    puts "All that shopping #{@new_roommate.name}, you must be hungry/thirsty!"
    eat_grocery
end



def eat_grocery
    puts "Which grocery item would you like to consume?"
    grocery_item = gets.chomp
    grocery_to_eat = Grocery.find_by(name: grocery_item)
    if !grocery_to_eat
        puts "Hey, sorry, I don't think that's a grocery in the fridgemate. Try again?"
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
         end
    end
    toss_grocery
end

def toss_grocery
    puts "Would you like to toss a grocery? (y/n)"
    toss_response = gets.chomp
    case toss_response.downcase 
    when "n"
    check_quantity
    when "no"
        check_quantity
    end
    case toss_response.downcase
    when "y"
        puts "Which grocery would you like to toss?"
        toss_grocery = gets.chomp
            grocery_to_toss = Grocery.find_by(name: toss_grocery).delete
            # grocery_to_toss.delete
            if !grocery_to_toss
                puts "I can't toss that, because it doesn't exist ): Try again?"
                toss_grocery
            end
    end
check_quantity
end

def check_quantity
    puts "Would you like to know how much of a grocery you have left? (y/n)"
        check_response = gets.chomp
        case check_response.downcase
        when "n"
            see_my_groceries
        when "no"
            see_my_groceries
        end
    puts "Which grocery would you like to check?"
    grocery_item = gets.chomp
    grocery_to_check = Grocery.find_by(name: grocery_item)
    if !grocery_to_check
        puts "Hey, sorry, I don't think that's a grocery in the fridgemate. Try again?"
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
        puts "Would you like to see another grocery? (y/n)"
        check_another = gets.chomp
        case check_another
            when "y"
            check_quantity
            when "Y"
            check_quantity
        end
    end
    see_my_groceries
end

def see_my_groceries
    puts "\n"
    puts "Wanna see your groceries? (y/n)"
    want_see = gets.chomp
    case want_see.downcase
    when "y"
        Fridgemate.all.each do |fridgemate|
            if fridgemate.roommate_id == @new_roommate.id
            x = fridgemate.grocery_id
            grocery = Grocery.all.find(x)
            puts "Grocery Name:#{grocery.name}\n Grcoery Quantity: #{grocery.quantity}".light_blue  
            end
        end
        end 
     

end




end



