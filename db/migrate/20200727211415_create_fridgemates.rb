class CreateFridgemates < ActiveRecord::Migration[6.0]
  def change
    create_table :fridgemates do |t|
      t.integer :roommate_id
      t.integer :grocery_id
    end
  end
end
