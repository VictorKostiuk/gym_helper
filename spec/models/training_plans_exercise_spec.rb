require "rails_helper"

RSpec.describe TrainingPlansExercise, type: :model do
  it { is_expected.to belong_to :exercise }
  it { is_expected.to belong_to :training_plan }
end
