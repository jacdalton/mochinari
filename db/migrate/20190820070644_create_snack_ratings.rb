class CreateSnackRatings < ActiveRecord::Migration[5.2]
  def change
    create_table :snack_ratings do |t|
      t.references :snack, foreign_key: true
      t.references :user, foreign_key: true
      t.integer :stars
      t.integer :price

      t.timestamps
    end
  end
end
