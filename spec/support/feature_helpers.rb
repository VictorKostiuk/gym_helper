# frozen_string_literal: true

require "rails_helper"
require "faker"

module FeatureHelpers
  def log_in(user)
    visit new_user_session_path
    fill_in "Email", with: user.email
    fill_in "Password", with: user.password
    click_on "Log in", class: "btn btn-dark"
  end

  def sign_up
    visit new_user_registration_path
    fill_in "Email", with: Faker::Internet.unique.email
    fill_in "Password", with: "12345678"
    fill_in "Password confirmation", with: "12345678"
    click_on "Sign up"
    sleep 1
  end

  def create_plan
    fill_in "Title", with: "test"
    fill_in "Description", with: "test1"
    click_on "Submit"
    sleep 1
  end

  def create_plan_with_exercise
    fill_in "Title", with: "test"
    fill_in "Description", with: "test1"
    select "push up"
    click_on "Submit"
    sleep 1
  end

  def create_exercise
    fill_in "Name", with: "push up"
    fill_in "Description", with: "test1"
    click_on "Submit"
    sleep 1
  end

  def create_exercise_set
    fill_in "Weight", with: 60
    fill_in "Reps", with: 12
    click_on "Submit"
    sleep 1
  end
end
