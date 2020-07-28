class Fridgemate < ActiveRecord::Base
    belongs_to :roommate
    belongs_to :grocery
end