class AddUserRefToEntries < ActiveRecord::Migration[6.0]
  def change
    add_reference :entries, :user, null: true, foreign_key: true
  end
end
