# frozen_string_literal: true

class CreateTrainingPlans < ActiveRecord::Migration[7.0]
  def change
    create_table :training_plans do |t|
      t.string :title
      t.string :description

      t.timestamps
    end
  end
end
