require "rails_helper"

RSpec.describe ExerciseSet, type: :model do
  it { is_expected.to belong_to :exercise }
  it { is_expected.to validate_presence_of :weight }
  it { is_expected.to validate_presence_of :reps }
end
