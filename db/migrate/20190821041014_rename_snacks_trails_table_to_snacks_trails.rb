class RenameSnacksTrailsTableToSnacksTrails < ActiveRecord::Migration[5.2]
  def change
    rename_table :snacks_trails_tables, :snacks_trails
  end
end
