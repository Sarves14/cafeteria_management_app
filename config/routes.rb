Rails.application.routes.draw do
  # For details on the DSL available within this file, see https://guides.rubyonrails.org/routing.html
  resources :users
  resources :items
  resources :carts
  resources :orders
  resources :clerks
  resources :admins
  resources :menuitems
  resources :categories
  delete "categories", to: "categories#delete"
  put "categories", to: "categories#change"
  patch "updatecategory", to: "categories#update"
  delete "menuitems", to: "menuitems#delete"
  put "menuitems", to: "menuitems#change"
  get "/", to: "home#index"
  get "/signin", to: "sessions#new", as: :new_session
  post "/signin", to: "sessions#create", as: :session
  delete "/signout", to: "sessions#destroy", as: :delete_session
  get "/viewrecords", to: "admins#viewrecords", as: :view_records
  get "/manageusers", to: "admins#manageusers", as: :manage_users
  get "/createadmin", to: "admins#createadmin", as: :create_admin
  get "/createclerk", to: "admins#createclerk", as: :create_clerk
  post "/createadmin", to: "admins#createadminuser"
  post "/createclerk", to: "admins#createclerkuser"
  get "/changefilters", to: "admins#change_filters", as: :change_filters
end
