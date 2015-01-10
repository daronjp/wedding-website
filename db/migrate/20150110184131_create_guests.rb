class CreateGuests < ActiveRecord::Migration
  def change
    create_table :guests do |t|
      t.string :email
      t.string :password_hash
      t.string :password_salt
      t.string :given_name
      t.string :family_name
      t.boolean :is_admin
      t.integer :logins

      t.timestamps
    end
  end
end
