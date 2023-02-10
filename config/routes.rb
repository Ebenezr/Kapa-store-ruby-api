Rails.application.routes.draw do
  resources :addresses
  resources :reviews
  resources :orders
  resources :user_payments
  resources :order_items
  resources :discounts
  resources :inventories
  resources :products
  resources :categories
  resources :users
  # Define your application routes per the DSL in https://guides.rubyonrails.org/routing.html

  # Defines the root path route ("/")
  # root "articles#index"
end
