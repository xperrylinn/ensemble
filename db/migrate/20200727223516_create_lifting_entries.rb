class CreateLiftingEntries < ActiveRecord::Migration[6.0]
  def change
    create_table :lifting_entries do |t|

      t.timestamps
    end
  end
end
