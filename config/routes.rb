Rails.application.routes.draw do
  get "up" => "rails/health#show", as: :rails_health_check

  root 'home#index'
  resources :resorts, only: %i[show] do
    resources :resting_places, only: %i[show], controller: 'resting_places', param: :resting_place do
    end
  end

  resources :feedback_requests, only: %i[create]
end
