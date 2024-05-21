Rails.application.routes.draw do

  root 'home#index'
  get 'about', to: 'static_pages#about'
  get 'contact', to: 'static_pages#contact'
  get 'terms', to: 'static_pages#terms'
  resources :resorts, only: %i[show] do
    resources :resting_places, only: %i[show], controller: 'resting_places' do
      resources :booking_enquiries, only: %i[new create], controller: 'booking_enquiries'
    end
  end

  resources :feedback_requests, only: %i[create]
end
