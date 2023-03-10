# frozen_string_literal: true

class TrainingPlansController < ApplicationController
  before_action :set_training_plan, only: %i[show edit update destroy]

  def index
    @training_plans = current_user.training_plans
  end

  def new
    @training_plan = TrainingPlan.new
  end

  def edit; end

  def show
    @exercise_sets = ExerciseSet.where(training_plan_id: @training_plan.id)
  end

  def create
    @training_plan = current_user.training_plans.new(training_plan_params)
    if @training_plan.save
      redirect_to training_plan_path(@training_plan)
    else
      render :new
    end
  end

  def update
    if @training_plan.update training_plan_params
      redirect_to training_plan_path(@training_plan)
    else
      render :edit
    end
  end

  def destroy
    @training_plan.destroy
    redirect_to training_plans_path
  end

  private

  def set_training_plan
    @training_plan = TrainingPlan.find(params[:id])
  end

  def training_plan_params
    params.require(:training_plan).permit(:title, :description, :user_id, exercise_ids: [])
  end
end
