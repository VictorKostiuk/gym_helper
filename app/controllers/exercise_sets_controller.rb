# frozen_string_literal: true

class ExerciseSetsController < ApplicationController
  before_action :set_exercise_set, only: %i[edit destroy update]
  before_action :set_exercise, only: %i[create new]
  before_action :set_plan, only: %i[create new]
  def new
    @exercise_set = ExerciseSet.new
  end

  def edit; end

  def create
    @exercise_set = @exercise.exercise_sets.new(exercise_set_params)
    @exercise_set.training_plan_id = @training_plan.id
    if @exercise_set.save
      redirect_to training_plan_path(@training_plan)
    else
      render :new
    end
  end

  def update
    if @exercise_set.update exercise_set_params
      redirect_to training_plan_path(@exercise_set.training_plan_id)
    else
      render :edit
    end
  end

  def destroy
    plan = @exercise_set.training_plan_id
    @exercise_set.destroy
    redirect_to training_plan_path(plan)
  end

  private

  def exercise_set_params
    params.require(:exercise_set).permit(:weight, :reps, :exercise_id, :training_plan_id)
  end

  def set_exercise_set
    @exercise_set = ExerciseSet.find(params[:id])
  end

  def set_plan
    @training_plan = TrainingPlan.find(params[:training_plan_id])
  end

  def set_exercise
    @exercise = Exercise.find(params[:exercise_id])
  end
end
