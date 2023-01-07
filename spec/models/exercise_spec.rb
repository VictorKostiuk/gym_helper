require "rails_helper"

RSpec.describe Exercise, type: :model do
  it { is_expected.to have_many :training_plans_exercises }
  it { is_expected.to have_many :exercise_sets }
  it { is_expected.to validate_presence_of :name }
  it { is_expected.to validate_presence_of :description }
end
