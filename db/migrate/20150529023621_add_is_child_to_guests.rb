class AddIsChildToGuests < ActiveRecord::Migration
  def change
    add_column :guests, :is_child, :boolean
  end
end
