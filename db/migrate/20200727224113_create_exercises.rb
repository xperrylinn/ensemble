class CreateExercises < ActiveRecord::Migration[6.0]
  def change
    create_table :exercises do |t|
      t.belongs_to :lifting_entry, null: false, foreign_key: true
      t.integer :sets
      t.integer :reps
      t.string :name
      t.integer :rpe
      t.integer :weight
      t.text :notes
      t.string :rep_units
      t.string :weight_units

      t.timestamps
    end
  end
end
