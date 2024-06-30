# frozen_string_literal: true

Rails.application.routes.draw do
  get 'user_profile/show'
  devise_for :admins
  devise_for :users, controllers: { }

  root 'home#index'
  get 'about', to: 'static_pages#about'
  get 'contact', to: 'static_pages#contact'
  get 'terms', to: 'static_pages#terms'

  resource :user_profile, only: %i[show], controller: 'user_profile'

  resources :resorts do
    member do
      delete :delete_image
      get :new_resting_place
      post :create_resting_place
    end
    resources :resting_places, controller: 'resting_places' do
      resources :reviews, only: %i[create destroy], controller: 'reviews'
      resources :booking_enquiries, only: %i[new create], controller: 'booking_enquiries'
    end
  end

  resources :feedback_requests, only: %i[new create]

  # Admin routes
  namespace :admin do
    resources :resorts do
      member do
        delete :delete_image
      end
      resources :resting_places, controller: 'resting_places'
    end
  end
end
