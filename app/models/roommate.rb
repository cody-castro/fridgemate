class Roommate < ActiveRecord::Base
    has_many :fridgemates
    has_many :groceries, through: :fridgemates
end