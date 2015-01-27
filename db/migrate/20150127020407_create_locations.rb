class CreateLocations < ActiveRecord::Migration
  def change
    create_table :locations do |t|
      t.string :description
      t.string :neighborhood
      t.string :category
      t.text :notes
      t.string :website
      t.string :image

      t.timestamps
    end
  end
end
