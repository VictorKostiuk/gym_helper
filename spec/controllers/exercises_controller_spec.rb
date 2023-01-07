require "rails_helper"

RSpec.describe ExercisesController, type: :controller do
  describe "GET #index" do
    let(:exercise) { FactoryBot.create(:exercise) }

    context "When it successfully renders" do
      before do
        get :index
      end

      it "populates an array of all categories" do
        expect(assigns(:exercise)).to match_array(exercise)
      end

      it "renders index view" do
        expect(response).to render_template :index
      end
    end
  end
end
