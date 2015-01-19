class AddRankToEntourages < ActiveRecord::Migration
  def change
    add_column :entourages, :photo, :string
    add_column :entourages, :gender, :string
    add_column :entourages, :rank, :integer
  end
end
