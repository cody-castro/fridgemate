class FridgeMate < ActiveRecord::Base
    belongs_to :roommate
    belongs_to :grocery
end