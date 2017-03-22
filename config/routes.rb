Rails.application.routes.draw do
  devise_for :users
  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html
  root "courses#index"
  resources :courses
  get 'account/new', to: "accounts#new"
  post 'accounts', to: "accounts#create"

  get 'accounts/login', to: "sessions#new"
  post 'accounts/sessions', to: "sessions#create"
  delete 'accounts/logout', to: "sessions#destroy"

  post "courses/:id/enroll", to: "courses#enroll"

  namespace :admin do
    root to: "courses#index"
    resources :accounts
  end
end
