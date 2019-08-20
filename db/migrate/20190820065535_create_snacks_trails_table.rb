class CreateSnacksTrailsTable < ActiveRecord::Migration[5.2]
  def change
    create_table :snacks_trails_tables do |t|
      t.references :snack, foreign_key: true
      t.references :trail, foreign_key: true
    end
  end
end
