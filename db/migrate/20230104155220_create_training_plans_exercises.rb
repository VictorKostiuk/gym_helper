# frozen_string_literal: true

class CreateTrainingPlansExercises < ActiveRecord::Migration[7.0]
  def change
    create_table :training_plans_exercises do |t|
      t.belongs_to :training_plan
      t.belongs_to :exercise

      t.timestamps
    end
  end
end
