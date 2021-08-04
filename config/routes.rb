Rails.application.routes.draw do
  resources :products
  root to: "application#index"
  # For details on the DSL available within this file, see https://guides.rubyonrails.org/routing.html
  get "/users", to: "users#index"
  get "/users/:id", to: "users#show"
end
