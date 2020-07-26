class AddEntryableIdAndEntryableTypeToEntry < ActiveRecord::Migration[6.0]
  def change
    add_column :entries, :entryable_id, :integer
    add_column :entries, :entryable_type, :string
  end
end
