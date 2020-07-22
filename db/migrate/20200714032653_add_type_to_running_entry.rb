class AddTypeToRunningEntry < ActiveRecord::Migration[6.0]
  def change
    add_column :running_entries, :type, :string
  end
end
