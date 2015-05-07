class FixColumnNameHouseholdName < ActiveRecord::Migration
  def change
    rename_column :households, :family_name, :household_name
  end
end
