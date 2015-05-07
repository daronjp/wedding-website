class AddZipToGuests < ActiveRecord::Migration
  def change
    add_column :guests, :zip, :string
  end
end
