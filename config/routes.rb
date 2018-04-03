Rails.application.routes.draw do
  root "dashboard#index"

  resources :users, only: [:new, :index, :create, :show]
  get '/login', to: 'sessions#new'
  post '/login', to: 'sessions#create'
  get '/logout', to: 'sessions#destroy'

  resources :vendors, only: [:show, :index]
  resources :programs, only: [:show, :index]

  resources :purchases, only: [:index] do
    resources :flags
  end

  namespace :admin do
    resources :purchases
  end

  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html
end
