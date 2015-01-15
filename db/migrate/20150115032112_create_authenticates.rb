class CreateAuthenticates < ActiveRecord::Migration
  def change
    create_table :authenticates do |t|
      t.string :group
      t.string :password
      t.boolean :is_admin

      t.timestamps
    end
  end
end
