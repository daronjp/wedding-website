class RemoveEmailFromGuest < ActiveRecord::Migration
  def up
    remove_column :guests, :email
  end

  def down
    add_column :guests, :email, :string
  end
end
