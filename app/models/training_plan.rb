# frozen_string_literal: true

class TrainingPlan < ApplicationRecord
  validates :title, :description, length: { minimum: 3 }, presence: true

  has_many :training_plans_exercises, dependent: :destroy
  has_many :exercises, through: :training_plans_exercises
end
