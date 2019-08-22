class AddLocationToUsers < ActiveRecord::Migration[5.2]
  def change
    add_column :users, :location, :string
    add_column :users, :longitude, :float
    add_column :users, :latitude, :float
  end
end
