class CreateFridgemates < ActiveRecord::Migration[6.0]
  def change
    create_table :fridgemates do |t|
      t.integer :grocery_id
      t.integer :roommate_id
    end
  end
end
