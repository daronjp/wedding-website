class AddAuxToGalileos < ActiveRecord::Migration
  def change
    add_column :galileos, :aux, :string
  end
end
