require 'pry'
class CLI

 def start
    puts "Welcome to your Fridgemate, please state your name."
    name = gets.chomp
    roommate = Roommate.find_by(name: name)
    puts "Hey, #{name}! 
    \n Type 1 to see your own groceries
    \n Type 2 to see all the groceries in the Fridgemate
    \n Type 3 to see which groceries are shared
    \n Type 4 to add a grocery to the Fridgemate"
    input = gets.chomp
    if input == 1
        name.groceries
    elsif input == 2
        Grocery.all
    elsif input == 3
        name.shared_groceries
    elsif input == 4
        puts "What is the name of the grocery?"
        grocery_name = gets.chomp
        puts "Which of the following does the grocery contain? (dairy, nuts, gluten)"
        grocery_contains = gets.chomp
        puts "How would you rate the quality of this product from 1-5
        \n 1 being store brand
        \n 2 being top shelf, highest quality
        "
        grocery_quality = gets.chomp
        puts "How much does this cost, to the nearest dollar? (ex: 5, 10, 15)"
        grocery_cost = gets.chomp
        puts "Okay, your grocery is now in the Fridgemate :)"
    end


 end
end