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

    def see_all_groceries 
        
    end

    def see_my_groceries

    end

    def check_quantity

    end

    def see_shared_groceries

    end

    def share_a_grocery
        
    end

    def gift_grocery

    end

    def toss_grocery 

    end

    def add_grocery

    end

    def eat_grocery

    end

    def move_out
    
    end

    def steal_grocery 
        
    end

    def gift_grocery 
        
    end

end