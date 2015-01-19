class CreateEntourages < ActiveRecord::Migration
  def change
    create_table :entourages do |t|
      t.string :given_name
      t.string :family_name
      t.string :role
      t.text :notes
      t.string :relationship

      t.timestamps
    end
  end
end
