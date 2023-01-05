# frozen_string_literal: true

class Exercise < ApplicationRecord
  has_many :exercise_sets
  has_many :training_plans_exercises
  has_many :training_plans, through: :training_plans_exercises
end
