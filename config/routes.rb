Rails.application.routes.draw do
  root "dashboard#index"

  resources :users, only: [:new, :index, :create, :show]
  get '/login', to: 'sessions#new'
  post '/login', to: 'sessions#create'
  
  resources :vendors, only: [:show, :index]
  resources :programs, only: [:show, :index]

  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html
end
