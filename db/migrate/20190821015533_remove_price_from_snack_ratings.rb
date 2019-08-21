class RemovePriceFromSnackRatings < ActiveRecord::Migration[5.2]
  def change
    remove_column :snack_ratings, :price, :integer
  end
end
