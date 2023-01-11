require "rails_helper"

RSpec.describe ExerciseSetsController, type: :controller do
  let(:user) { create(:user) }

  before do
    sign_in(user)
  end

  describe "PUT update" do
    let(:exercise) { create(:exercise) }
    let(:training_plan) { create(:training_plan) }
    let(:exercise_set) do
      create(:exercise_set, exercise_id: exercise.id, training_plan_id: training_plan.id)
    end

    it "assigns the requested account to @account" do
      patch :update, params: { exercise_set: attributes_for(:exercise_set), id: exercise_set.id }
      expect(assigns(:exercise_set)).to eq exercise_set
    end

    it "changes account attributes" do
      patch :update,
            params: { exercise_set: { reps: 15 }, id: exercise_set.id }
      exercise_set.reload
      expect(exercise_set.reps).to eq 15
    end

    it "redirects to the updated account" do
      patch :update, params: { exercise_set: attributes_for(:exercise_set), id: exercise_set.id }
      expect(response).to have_http_status(:found)
    end
  end

  describe "POST create" do
    let(:exercise) { create(:exercise) }
    let(:training_plan) { create(:training_plan) }

    it "saves the new account" do
      expect do
        post :create, params: { exercise_set: attributes_for(:exercise_set), exercise_id: exercise.id,
                                training_plan_id: training_plan.id }
      end.to change(ExerciseSet, :count).by(1)
    end

    it "redirects to show view" do
      post :create, params: { exercise_set: attributes_for(:exercise_set), exercise_id: exercise.id,
                              training_plan_id: training_plan.id }
      expect(response).to have_http_status(:found)
    end
  end

  describe "DELETE destroy" do
    let(:exercise) { create(:exercise) }
    let(:training_plan) { create(:training_plan) }
    let(:exercise_set) do
      create(:exercise_set, exercise_id: exercise.id, training_plan_id: training_plan.id)
    end

    it "assigns @teams" do
      delete :destroy, params: { id: exercise_set.id }

      expect { exercise_set.reload }.to raise_error(ActiveRecord::RecordNotFound)
    end
  end
end
