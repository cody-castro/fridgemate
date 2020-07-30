require 'pry'

class CLI

def start
    puts "          Welcome to fridgemate! \n "
    create_new_roommate
end

def create_new_roommate
    puts "I see we have a new Roommate, what is you name?"
    name = gets.chomp
    puts "Do you have any of these allergies, #{name}? (lactose intolerant, nut allergy, gluten free, or none?)"
    allergy = gets.chomp
    puts "What is your Grocery Budget? (Please enter a number 1-500)"
    budget = gets.chomp
    # Roommate.create(name: name, allergy: allergy, budget: budget)
    puts "Alrighty! You're all moved in!"
    puts "Looks like you need to go grocery shopping! What's the name of the grocery item you'd like to purchase?"
    add_groceries
end

def add_groceries
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
    puts "Enjoy your #{grocery_name}, #{name}!"
    # Grocery.create(name: grocery_name, quantity: 4, contains: grocery_contains, quality: grocery_quality, cost: grocery_cost)
    puts "Would you like to add some more groceries? (y/n)"
    shoping_response = gets.chomp
# when
#     shopping_response == "y" || shopping_response == "yes"
#     add_groceries
end

# eat_grocery
# end

def eat_grocery
    puts "All that shopping, you must be hungry!"
    puts "Which grocery item would you like to eat?"
    grocery_item = get.chomp
    grocery_item.quantity.subtract(1)
    
    # subtract amount from grocery
end

def toss_grocery
    puts "Which grocery item would you like to through away"
    toss_this = gets.chomp
    Grocery.delete(toss_this)
end

def check_quantity
    puts "Which grocery would you like to check?"
    check_grocery = gets.chomp
    check_grocery.quantity
when
    puts "Hmmm, sorry, I don't think you have this grocery item, try again"
    check_quantity
end


end