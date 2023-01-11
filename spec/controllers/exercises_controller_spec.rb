require "rails_helper"

RSpec.describe ExercisesController, type: :controller do
  let(:user) { create(:user) }

  before do
    sign_in(user)
  end

  describe "GET index" do
    let!(:exercises) { FactoryBot.create(:exercise) }

    it "index" do
      get :index
      expect(assigns(:exercises)).to eq([exercises])
    end

    it "renders the http status ok" do
      get :index
      expect(response).to have_http_status(:ok)
    end
  end

  describe "GET show" do
    let!(:exercise) { FactoryBot.create(:exercise) }

    it "assigns @teams" do
      get :show, params: { id: exercise.id }
      expect(assigns["exercise"].name).to eq(exercise.name)
      expect(assigns["exercise"].description).to eq(exercise.description)
    end

    it "renders the http status ok" do
      get :show, params: { id: exercise.id }
      expect(response).to have_http_status(:ok)
    end
  end

  describe "PUT update" do
    let(:exercise) { create(:exercise) }

    it "assigns the requested account to @account" do
      patch :update, params: { exercise: attributes_for(:exercise), id: exercise.id }
      expect(assigns(:exercise)).to eq exercise
    end

    it "changes account attributes" do
      patch :update,
            params: { exercise: { description: "New description" }, id: exercise.id }
      exercise.reload
      expect(exercise.description).to eq "New description"
    end

    it "redirects to the updated account" do
      patch :update, params: { exercise: attributes_for(:exercise), id: exercise.id }
      expect(response).to have_http_status(:found)
    end
  end

  describe "POST create" do
    it "saves the new account" do
      expect do
        post :create, params: { exercise: attributes_for(:exercise) }
      end.to change(Exercise, :count).by(1)
    end

    it "redirects to show view" do
      post :create, params: { exercise: attributes_for(:exercise) }
      expect(response).to have_http_status(:found)
    end
  end

  describe "DELETE destroy" do
    let!(:exercise) { create(:exercise) }

    it "assigns @teams" do
      expect { delete :destroy, params: { id: exercise.id } }.to change(Exercise, :count).by(-1)
    end
  end
end
