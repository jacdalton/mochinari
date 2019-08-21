class AddLocationToTrails < ActiveRecord::Migration[5.2]
  def change
    add_column :trails, :location, :string
    add_column :trails, :longitude, :float
    add_column :trails, :latitude, :float
  end
end
