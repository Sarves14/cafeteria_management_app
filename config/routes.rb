Rails.application.routes.draw do
  # For details on the DSL available within this file, see https://guides.rubyonrails.org/routing.html
  resources :users
  resources :items
  resources :carts
  resources :orders
  resources :clerks
  resources :admins
  get "/", to: "home#index"
  get "/signin", to: "sessions#new", as: :new_session
  post "/signin", to: "sessions#create", as: :session
  delete "/signout", to: "sessions#destroy", as: :delete_session
end
