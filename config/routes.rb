Rails.application.routes.draw do
  resources :vendors, only: [:show, :index]
  resources :programs, only: [:show, :index]

  root "dashboard#index"
  resources :users, only: [:new, :index, :create, :show]
  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html
end
