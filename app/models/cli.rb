require 'pry'
class CLI

def start
    puts "          Welcome to fridgemate!"
    create_new_roommate
end

def create_new_roommate
    puts "I see we have a new Roommate, what is you name?"
    name = gets.chomp
    puts "Do you have any of these allergies, #{name}? (lactose intolerant, nut allergy, gluten free, or none?)"
    allergy = gets.chomp
    puts "What is your Grocery Budget? (Please enter a number 1-500)"
    budget = gets.chomp
    Roommate.create(name, allergy, budget)
    puts "Alrighty! You're all moved in!"
    add_groceries
end

def add_groceries
    puts "Looks like you need to go grocery shopping! What's the name of the grocery item you'd like to purchase?"
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
    Grocery.create(name: grocery_name, quantity: 4, contains: grocery_contains, quality: grocery_quality, cost: grocery_cost, owner = self )
end

def eat_grocery
    puts "Which grocery item would you like to select?"
    grocery_item = get.chomp
    # subtract amount from grocery
end

end