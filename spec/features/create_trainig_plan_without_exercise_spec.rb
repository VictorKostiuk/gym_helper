# frozen_string_literal: true

require "support/feature_helpers"
require "rails_helper"

RSpec.describe "Training plan", driver: :selenium_chrome, type: :feature do

  it "Registered user creates training plan" do
    sign_up
    visit training_plans_path
    click_on "New plan"
    create_plan
    visit training_plans_path
    expect(page).to have_content "test"
  end

  it "Non-registered user try create training plan" do
    visit training_plans_path

    expect(page).to have_content "You need to sign in or sign up before continuing."
  end
end
