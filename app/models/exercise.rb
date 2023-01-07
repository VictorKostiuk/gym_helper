# frozen_string_literal: true

class Exercise < ApplicationRecord
  validates :name, :description, length: { minimum: 3 }, presence: true
  has_many :exercise_sets, dependent: :destroy
  has_many :training_plans_exercises, dependent: :destroy
  has_many :training_plans, through: :training_plans_exercises
end
