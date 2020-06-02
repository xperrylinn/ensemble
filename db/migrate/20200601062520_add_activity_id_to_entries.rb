class AddActivityIdToEntries < ActiveRecord::Migration[6.0]
  def change
    add_column :entries, :activity_id, :integer
  end
end
