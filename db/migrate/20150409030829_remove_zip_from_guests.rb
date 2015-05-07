class RemoveZipFromGuests < ActiveRecord::Migration
  def up
    remove_column :guests, :zip
  end

  def down
    add_column :guests, :zip, :integer
  end
end
