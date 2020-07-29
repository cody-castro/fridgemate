require 'pry'
class CLI

 def start
    puts "Welcome to your Fridgemate, please state your name."
    name = gets.chomp
    roommate = Roommate.find_by(name: name)
 
    # if Roommate
    #     puts ""
    # else
    #     puts ""
    #     Roommate.______
    binding.pry
 end
end