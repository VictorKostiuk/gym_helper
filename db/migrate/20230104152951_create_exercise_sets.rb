# frozen_string_literal: true

class CreateExerciseSets < ActiveRecord::Migration[7.0]
  def change
    create_table :exercise_sets do |t|
      t.integer :reps
      t.integer :weight
      t.belongs_to :exercise

      t.timestamps
    end
  end
end
