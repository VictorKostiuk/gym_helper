class AddTrainingPlanIdToSet < ActiveRecord::Migration[7.0]
  def change
    add_column :exercise_sets, :training_plan_id, :integer
  end
end
