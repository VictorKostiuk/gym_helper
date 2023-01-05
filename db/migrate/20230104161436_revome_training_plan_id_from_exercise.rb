# frozen_string_literal: true

class RevomeTrainingPlanIdFromExercise < ActiveRecord::Migration[7.0]
  def change
    remove_column :exercises, :training_plan_id
  end
end
