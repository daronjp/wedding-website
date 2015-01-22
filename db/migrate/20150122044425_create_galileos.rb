class CreateGalileos < ActiveRecord::Migration
  def change
    create_table :galileos do |t|
      t.string :controller
      t.string :view
      t.string :session
      t.string :user_id

      t.timestamps
    end
  end
end
