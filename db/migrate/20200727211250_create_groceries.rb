class CreateGroceries < ActiveRecord::Migration[6.0]
  def change
    create_table :groceries do |t|
      t.string :name
      t.string :contains
      t.integer :quantity
      t.integer :quality
      t.integer :cost
      t.string :owner
    end
  end
end
