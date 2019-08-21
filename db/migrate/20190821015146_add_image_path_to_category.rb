class AddImagePathToCategory < ActiveRecord::Migration[5.2]
  def change
    add_column :categories, :image_path, :string
  end
end
