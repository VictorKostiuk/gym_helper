# frozen_string_literal: true

require "support/feature_helpers"
require "rails_helper"

RSpec.describe "Exercise", driver: :selenium_chrome, type: :feature do

  it "Registered user creates exercise" do
    sign_up
    visit exercises_path
    click_on "New Exercise"
    create_exercise
    visit exercises_path
    expect(page).to have_content "test"
  end

  it "Non-registered user try create exercise" do
    visit exercises_path

    expect(page).to have_content "You need to sign in or sign up before continuing."
  end
end
