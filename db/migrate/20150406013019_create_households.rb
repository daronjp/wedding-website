class CreateHouseholds < ActiveRecord::Migration
  def change
    create_table :households do |t|
      t.integer :id
      t.string :family_name
      t.integer :seats

      t.timestamps
    end
  end
end
