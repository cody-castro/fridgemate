require 'pry'
class CLI

def start
    puts "\n          Welcome to fridgemate!\n"
    create_new_roommate
end

def create_new_roommate
    puts "\nI see we have a new Roommate, what is your name?"
    name = gets.chomp
    puts "Do you have any of these allergies, #{name}? (lactose intolerant, nut allergy, gluten free, or none?)"
    allergy = gets.chomp
    puts "What is your Grocery Budget? (Please enter a number 1-500)"
    budget = gets.chomp
    new_roommate = Roommate.create(name: name, allergy: allergy, budget: budget)
    puts "\nAlrighty! You're all moved in!"
    puts "\nLooks like you need to go grocery shopping!" 
    add_groceries(new_roommate)
end

def add_groceries(new_roommate)
    puts "\n What's the name of the grocery item you'd like to purchase?"
    grocery_name = gets.chomp
    puts "Wow! #{grocery_name} sounds delicious, what's the quality of this grocery (1-5)?\n
    1 being store brand \n
    5 being top shelf, highest quality out there \n
    "
    grocery_quality = gets.chomp
    puts "How much does #{grocery_name} cost rounded to the nearest dollar?"
    grocery_cost = gets.chomp
    puts "Does it contain any allergens? pick one: nuts, dairy, gluten"
    grocery_contains = gets.chomp
    added_grocery = Grocery.create(name: grocery_name, quantity: 4, contains: grocery_contains, quality: grocery_quality, cost: grocery_cost)
    puts "Enjoy your #{grocery_name}, #{new_roommate.name}!"
    puts "\n Do you want to add some more? (y/n)"
    more_response = gets.chomp
    case more_response
    when "y"
        add_groceries(new_roommate)
    when "Y"
        add_groceries(new_roommate)
    end
    puts "All that shopping #{new_roommate.name}, you must be hungry/thirsty!"
    eat_grocery(new_roommate)
end



def eat_grocery(new_roommate)
    puts "Which grocery item would you like to consume?"
    grocery_item = gets.chomp
    grocery_to_eat = Grocery.find_by(name: grocery_item)
    if !grocery_to_eat
        puts "Hey, sorry, I don't think that's a grocery in the fridgemate. Try again?"
        eat_grocery(new_roommate)
    else
        grocery_to_eat.update(quantity: grocery_to_eat.quantity - 1)
        puts "Would you like to eat another grocery? (y/n)"
        eat_another = gets.chomp
        case eat_another
            when "y"
            eat_grocery(new_roommate)
            when "Y"
            eat_grocery(new_roommate) 
         end
    end
    toss_grocery(new_roommate)
end

def toss_grocery(new_roommate)
    puts "Would you like to toss a grocery? (y/n)"
    toss_response = gets.chomp
    case toss_response 
    when toss_response == "y"
        puts "Which grocery would you like to toss?"
        grocery_to_toss = gets.chomp
    when toss_response == "Y"
        puts "Which grocery would you like to toss?"
        grocery_to_toss = gets.chomp
    end
    grocery_to_toss = Grocery.find_by(name: toss_grocery)
    if !toss_grocery
        puts "I can't toss that, because it doesn't exist ): Try again?"
    else
        grocery_to_toss.delete
        puts "Would you like to toss another? (y/n)"
        toss_another = gets.chomp
    case toss_another
    when "y"
        toss_grocery(new_roommate)
    when "Y"
        toss_grocery(new_roommate)
        end
    end
check_quantity(new_roommate)
end

def check_quantity(new_roommate)
    puts "Which grocery would you like to check?"
    grocery_item = gets.chomp
    grocery_to_check = Grocery.find_by(name: grocery_item)
    if !grocery_to_check
        puts "Hey, sorry, I don't think that's a grocery in the fridgemate. Try again?"
        check_quantity(new_roommate)
    else
        amount = grocery_to_check.quantity
        if amount == 4
            puts "#{grocery_to_check.name} item is Full"
        elsif amount == 3
            puts "#{grocery_to_check.name} item is Almost Full"
        elsif amount == 2
            puts "#{grocery_to_check.name} item is Half Full"
        elsif amount == 1
            puts "#{grocery_to_check.name} item is Almost Gone"
        end
        puts "Would you like to see another grocery? (y/n)"
        check_another = gets.chomp
        case check_another
            when "y"
            check_quantity(new_roommate)
            when "Y"
            check_quantity(new_roommate)
        end
    end
    see_my_groceries(new_roommate)
end


def see_my_groceries(new_roommate)
    puts "Wanna see your groceries? (y/n)"
    want_see = gets.chomp
    case want_see
        when "y"
            puts Grocery.all.where(roommate_id: new_roommate.id)
        when "Y"
            puts Grocery.all.where(roommate_id: new_roommate.id)
        when "n"
            puts "bye"
        when "N"
            puts "bye"
    end
end



end