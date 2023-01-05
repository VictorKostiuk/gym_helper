# frozen_string_literal: true

Rails.application.routes.draw do
  devise_scope :user do
    get 'users', to: 'devise/sessions#new'
  end
  devise_for :users
  resources :exercises
  resources :exercise_sets

  resources :training_plans do
    resources :exercises
  end

  root to: 'home#index'
end
