Rails.application.routes.draw do
  devise_for :users
  root to: "pages#home"
  get "profiles/filter", to: "profiles#filter"
  # Define your application routes per the DSL in https://guides.rubyonrails.org/routing.html
  # Defines the root path route ("/")
  # root "articles#index"
  resources :professions
  resources :profiles
  # to remove after developpement
  get "components", to: "pages#components"
  resources :posts
end
