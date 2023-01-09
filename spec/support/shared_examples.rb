RSpec.shared_examples 'A Ruby object with 4 elements' do
  it "Non-registered user try create exercise" do
    visit exercises_path

    expect(page).to have_content "You need to sign in or sign up before continuing."
  end
end
