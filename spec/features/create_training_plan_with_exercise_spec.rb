
require "support/feature_helpers"
require "rails_helper"

RSpec.describe "Training plan", driver: :selenium_chrome, type: :feature do

  it "Registered user creates training plan with exercise" do
    sign_up
    visit exercises_path
    click_on "New Exercise"
    create_exercise
    visit training_plans_path
    click_on "New plan"
    create_plan_with_exercise
    expect(page).to have_content "Exercises: 1"
  end

  include_examples "Examples", TrainingPlan
end
