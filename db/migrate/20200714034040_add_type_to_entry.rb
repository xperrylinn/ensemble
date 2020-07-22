class AddTypeToEntry < ActiveRecord::Migration[6.0]
  def change
    add_column :entries, :type, :string
  end
end
