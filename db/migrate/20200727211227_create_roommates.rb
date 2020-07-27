class CreateRoommates < ActiveRecord::Migration[6.0]
  def change
    create_table :roommates do |t|
      t.string :name
      t.string :allergy
      t.integer :budget
    end
  end
end
