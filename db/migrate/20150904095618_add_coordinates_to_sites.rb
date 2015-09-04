class AddCoordinatesToSites < ActiveRecord::Migration
  def change
    add_column :sites, :latitude, :float
    add_column :sites, :longitude, :float
  end
end
