Rails.application.routes.draw do

  root 'home#index'
  resources :resorts, only: %i[show] do
    resources :resting_places, only: %i[show], controller: 'resting_places' do
      resources :booking_enquiries, only: %i[new create], controller: 'booking_enquiries'
    end
  end

  resources :feedback_requests, only: %i[create]
end
