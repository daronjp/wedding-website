class AddEmailToHouseholds < ActiveRecord::Migration
  def change
    add_column :households, :email, :string
    add_column :households, :logins, :integer
  end
end
