# frozen_string_literal: true

class ExerciseSetsController < ApplicationController
  def new
    @exercise_set = ExerciseSet.new
  end

  def create
    @exercise = params[:exercise_id]
    @exercise_set = ExerciseSet.new(exercise_set_params)

    if @exercise_set.save
      redirect_to :back
    else
      render :new
    end
  end

  private

  def exercise_set_params
    params.require(:exercise_set).permit(:weight, :reps, :exercise_id)
  end
end
