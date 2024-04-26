Rails.application.routes.draw do
  get "up" => "rails/health#show", as: :rails_health_check

  root 'home#index'
  resources :hotels, only: %i[index show]

  resources :feedback_requests, only: %i[create]
end
