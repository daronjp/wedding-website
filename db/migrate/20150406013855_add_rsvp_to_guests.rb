class AddRsvpToGuests < ActiveRecord::Migration
  def change
    add_column :guests, :rsvp, :boolean
    add_column :guests, :food, :string
  end
end
