# frozen_string_literal: true

class ExerciseSet < ApplicationRecord
  validates :weight, :reps, presence: true
  belongs_to :exercise
end
