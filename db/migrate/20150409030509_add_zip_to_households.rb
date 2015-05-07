class AddZipToHouseholds < ActiveRecord::Migration
  def change
    add_column :households, :zip, :integer
  end
end
