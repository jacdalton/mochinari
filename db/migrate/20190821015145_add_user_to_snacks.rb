class AddUserToSnacks < ActiveRecord::Migration[5.2]
  def change
    add_reference :snacks, :user, foreign_key: true
  end
end
