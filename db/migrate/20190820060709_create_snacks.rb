class CreateSnacks < ActiveRecord::Migration[5.2]
  def change
    create_table :snacks do |t|
      t.string :name
      t.text :description
      t.string :shop_name
      t.string :shop_location
      t.float :latitude
      t.float :longitude
      t.references :category, foreign_key: true

      t.timestamps
    end
  end
end
