Rails.application.routes.draw do
  resources :products
  devise_for :users
  resources :profiles, only: :show
  resources :line_items, only: [:destroy, :create]
  resources :carts

  root "products#index"

end
