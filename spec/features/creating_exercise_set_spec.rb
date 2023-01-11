require "support/feature_helpers"
require "rails_helper"

RSpec.describe "Training plan", driver: :selenium_chrome, type: :feature do
  it "Registered user creates training plan with exercise" do
    sign_up
    visit training_plans_path
    click_on "New plan"
    create_plan_with_exercise
    click_on "push up"
    create_exercise_set
    expect(page).to have_content "60"
  end

  include_examples "Examples", TrainingPlan
end
