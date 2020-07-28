class RemoveOwnerIdFromGroceries < ActiveRecord::Migration[6.0]
  def change
    remove_column :groceries, :owner
  end
end
