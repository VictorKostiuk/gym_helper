# frozen_string_literal: true

class TrainingPlan < ApplicationRecord
  validates :title, :description, length: { minimum: 3 }

  has_many :training_plans_exercises
  has_many :exercises, through: :training_plans_exercises
end
