# frozen_string_literal: true

class ExercisesController < ApplicationController
  before_action :set_exercise, only: %i[show edit update destroy]

  def index
    @exercises = Exercise.all
    render :index
  end

  def new
    @exercise = Exercise.new
  end

  def edit; end

  def show; end

  def create
    @exercise = Exercise.new(exercise_params)
    if @exercise.save
      redirect_to exercise_path(@exercise)
    else
      render :new
    end
  end

  def update
    if @exercise.update exercise_params
      redirect_to exercise_path(@exercise)
    else
      render :edit
    end
  end

  def destroy
    @exercise.destroy
    redirect_to exercises_path
  end

  private

  def set_exercise
    @exercise = Exercise.find(params[:id])
  end

  def exercise_params
    params.require(:exercise).permit(:name, :description)
  end
end
