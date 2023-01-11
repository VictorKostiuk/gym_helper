RSpec.shared_examples "Examples" do
  it "Non-registered user try create obj" do |obj|
    if obj == TrainingPlan
      visit training_plans_path
    else
      visit exercises_path
    end

    expect(page).to have_content "You need to sign in or sign up before continuing."
  end
end
