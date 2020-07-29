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


def shared_groceries

end

def add_grocery

end

end