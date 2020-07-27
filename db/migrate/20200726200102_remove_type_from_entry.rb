class RemoveTypeFromEntry < ActiveRecord::Migration[6.0]
  def change
    remove_column :entries, :type, :text
  end
end
