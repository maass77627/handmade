Rails.application.routes.draw do

  get 'shopping_carts/:id' => "shopping_carts#show", as: "shopping_cart"
delete 'shopping_carts/:id' => "shopping_carts#destroy"

  resources :orders
  resources :products
  resources :users
  resources :shopping_carts
  root to: "application#index"
  get 'login', to: 'sessions#new'
  post 'login', to: 'sessions#create'
  get 'logout', to: 'sessions#destroy'

  # post 'line_items' => "line_items#create"
  
  post 'line_items/:id/add' => "line_items#add_quantity", as: "line_item_add"
  post 'line_items/:id/reduce' => "line_items#reduce_quantity", as: "line_item_reduce"
  post 'line_items' => "line_items#create"
  get 'line_items/:id' => "line_items#show", as: "line_item"
  delete 'line_items/:id' => "line_items#destroy"
  # For details on the DSL available within this file, see https://guides.rubyonrails.org/routing.html
  # get "/users", to: "users#index"
  # get "/users/:id", to: "users#show"
end
