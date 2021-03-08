Rails.application.routes.draw do
  resources :listings
  resources :categories
  devise_for :users
  # For details on the DSL available within this file, see https://guides.rubyonrails.org/routing.html
  root to: "listings#index"
  get "/payments/success", to: 'payments#success'
  post "/payments/webhook", to: 'payments#webhook'
  get "/users/profile", to: 'users#profile', as: 'profile'
  get "/search", to: 'listings#search', as: 'search'
end
