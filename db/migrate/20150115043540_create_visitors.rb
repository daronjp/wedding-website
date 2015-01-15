class CreateVisitors < ActiveRecord::Migration
  def change
    create_table :visitors do |t|
      t.string :group
      t.string :password_hash
      t.string :password_salt
      t.boolean :is_admin

      t.timestamps
    end
  end
end
