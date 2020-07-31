class Grocery < ActiveRecord::Base
    has_many :fridgemates
    has_many :roommates, through: :fridgemates 




    
end