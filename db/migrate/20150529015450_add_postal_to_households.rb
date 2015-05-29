class AddPostalToHouseholds < ActiveRecord::Migration
  def change
    add_column :households, :postal, :string
  end
end
