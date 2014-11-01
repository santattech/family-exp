Myapp::Application.routes.draw do
  root to: 'home#index'

  resources :users
  get "/sign_up" => "users#new"

  resources :sessions, only: [:new, :create, :destroy]

  get "/sign_in" => "sessions#new"
  delete "/sign_out" => "sessions#destroy"
end
