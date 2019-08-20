class CreateSnackImages < ActiveRecord::Migration[5.2]
  def change
    create_table :snack_images do |t|
      t.references :snack, foreign_key: true
      t.references :user, foreign_key: true
      t.string :image_path
      t.string :comment

      t.timestamps
    end
  end
end
