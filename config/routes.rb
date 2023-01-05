# frozen_string_literal: true

Rails.application.routes.draw do
  devise_scope :user do
    get 'users', to: 'devise/sessions#new'
  end
  devise_for :users
  resources :exercise_sets
  resources :exercises
  resources :training_plans do
    resources :exercises do
      resources :exercise_sets
    end
  end

  root to: 'home#index'
end
