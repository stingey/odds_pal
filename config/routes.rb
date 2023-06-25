Rails.application.routes.draw do
  devise_for :users, controllers: {
        registrations: 'users/registrations'
  }
  # Define your application routes per the DSL in https://guides.rubyonrails.org/routing.html
  resources :sports, only: %i[index]
  resources :teams, only: %i[index]
  resources :favorite_sports, only: %i[create destroy]
  # Defines the root path route ("/")
  root "sports#index"
end
