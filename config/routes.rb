Rails.application.routes.draw do
  devise_for :users
  root to: "pages#home"
  get "profiles/filter", to: "profiles#filter"
  get "profiles/all", to: "profiles#all"
  get "my_profile", to: "profiles#my_profile"
  get "professions/autocomplete", to: "professions#autocomplete"
  get "pages/home_worker", to: "pages#home_worker"


  # Define your application routes per the DSL in https://guides.rubyonrails.org/routing.html
  # Defines the root path route ("/")
  # root "articles#index"
  # to remove after developpement
  get "components", to: "pages#components"


  resources :professions
  resources :profiles do
    resources :post, only: [:index]
    resources :reservations, only: [:new, :create ]
  end
  resources :posts do
    resources :reservations, only: [:new, :create ]
    resources :reviews, only: [:new, :create, :edit, :update, :destroy]

  end
  resources :reservations, only: [:index, :show, :update, :destroy]
  resources :my_professions
  #resources :review, only:[:new, :create]

end
