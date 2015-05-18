class AddIpToGalileos < ActiveRecord::Migration
  def change
    add_column :galileos, :ip, :string
    add_column :galileos, :household, :string
    add_column :galileos, :rsvp, :boolean
    add_column :galileos, :food, :string
  end
end
