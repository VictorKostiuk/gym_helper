require "rails_helper"

RSpec.describe TrainingPlansController, type: :controller do
  describe "GET index" do
    let!(:training_plans) { FactoryBot.create(:training_plan) }

    it "index" do
      get :index
      expect(assigns(:training_plans)).to eq([training_plans])
    end

    it "renders the http status ok" do
      get :index
      expect(response).to have_http_status(:ok)
    end
  end

  describe "GET show" do
    let!(:training_plan) { FactoryBot.create(:training_plan) }

    it "assigns @teams" do
      get :show, params: { id: training_plan.id }
      expect(assigns["training_plan"].title).to eq(training_plan.title)
      expect(assigns["training_plan"].description).to eq(training_plan.description)
    end

    it "renders the http status ok" do
      get :show, params: { id: training_plan.id }
      expect(response).to have_http_status(:ok)
    end
  end

  describe "PUT update" do
    let(:training_plan) { create(:training_plan) }

    it "assigns the requested account to @account" do
      patch :update, params: { training_plan: attributes_for(:training_plan), id: training_plan.id }
      expect(assigns(:training_plan)).to eq training_plan
    end

    it "changes account attributes" do
      patch :update,
            params: { training_plan: { description: "New description" }, id: training_plan.id }
      training_plan.reload
      expect(training_plan.description).to eq "New description"
    end

    it "redirects to the updated account" do
      patch :update, params: { training_plan: attributes_for(:training_plan), id: training_plan.id }
      expect(response).to have_http_status(:found)
    end
  end

  describe "POST create" do
    it "saves the new account" do
      expect do
        post :create, params: { training_plan: attributes_for(:training_plan) }
      end.to change(TrainingPlan, :count).by(1)
    end

    it "redirects to show view" do
      post :create, params: { training_plan: attributes_for(:training_plan) }
      expect(response).to have_http_status(:found)
    end
  end

  describe "DELETE destroy" do
    let!(:training_plan) { create(:training_plan) }

    it "assigns @teams" do
      expect { delete :destroy, params: { id: training_plan.id } }.to change(TrainingPlan, :count).by(-1)
    end
  end
end
