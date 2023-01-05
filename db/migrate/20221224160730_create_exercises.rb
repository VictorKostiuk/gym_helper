# frozen_string_literal: true

class CreateExercises < ActiveRecord::Migration[7.0]
  def change
    create_table :exercises do |t|
      t.string :name
      t.string :description
      t.integer :sets
      t.integer :reps
      t.integer :weight
      t.integer :training_plan_id

      t.timestamps
    end
  end
end
