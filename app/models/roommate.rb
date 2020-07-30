class Roommate < ActiveRecord::Base
    has_many :fridgemates
    has_many :groceries, through: :fridgemates

# def self.____
#     puts
#     response = gets.chomp
#     puts
#     response = gets.chomp
#     roommate = Roommate.find_by(name:"")
# end

# self.groceries
#   Grocery.all


    def check_quantity

    end

    def toss_grocery 

    end

    def add_grocery

    end

    def eat_grocery

    end
end 
