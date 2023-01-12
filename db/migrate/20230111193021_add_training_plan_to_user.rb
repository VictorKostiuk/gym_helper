class AddTrainingPlanToUser < ActiveRecord::Migration[7.0]
  def change
    change_table :training_plans do |t|
      t.belongs_to :user
    end
  end
end
