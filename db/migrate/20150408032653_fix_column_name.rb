class FixColumnName < ActiveRecord::Migration
  def change
    rename_column :guests, :family_id, :household_id
  end
end
