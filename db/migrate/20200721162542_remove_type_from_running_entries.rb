class RemoveTypeFromRunningEntries < ActiveRecord::Migration[6.0]
  def change
    remove_column :running_entries, :type, :string
  end
end
