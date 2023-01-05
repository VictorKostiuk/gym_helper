# frozen_string_literal: true

class TrainingPlansExercise < ApplicationRecord
  belongs_to :training_plan
  belongs_to :exercise
end
