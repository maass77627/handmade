Rails.application.routes.draw do
  resources :products
  resources :users
  root to: "application#index"
  get 'login', to: 'sessions#new'
  post 'login', to: 'sessions#create'
  delete 'logout', to: 'sessions#destroy'
  
  # For details on the DSL available within this file, see https://guides.rubyonrails.org/routing.html
  # get "/users", to: "users#index"
  # get "/users/:id", to: "users#show"
end
