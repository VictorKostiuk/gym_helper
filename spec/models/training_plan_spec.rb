require "rails_helper"

RSpec.describe TrainingPlan, type: :model do
  it { is_expected.to have_many :training_plans_exercises }
  it { is_expected.to validate_presence_of :title }
  it { is_expected.to validate_presence_of :description }
end
