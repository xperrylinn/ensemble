class CreateRunningEntries < ActiveRecord::Migration[5.0]
    def change
      create_table :running_entries do |t|
        t.text :strava_entry
   
        t.timestamps
      end
    end
  end
