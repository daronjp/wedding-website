class RemoveIsAdminFromGuests < ActiveRecord::Migration
  def up
    remove_column :guests, :password_hash
    remove_column :guests, :password_salt
    remove_column :guests, :is_admin
  end

  def down
    add_column :guests, :is_admin, :boolean
    add_column :guests, :password_salt, :string
    add_column :guests, :password_hash, :string
  end
end
