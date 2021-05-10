Rails.application.routes.draw do
  resources :carts
  resources :categories
  resources :product_images
  root 'products#index'
  
  resources :users
  resources :orders do 
    collection do
      get :verify_payment
      get :success
    end
  end
  resources :checkouts
  resources :sessions, only: [:new, :create, :destroy]
  resources :products do
    collection do
      get :cart
      get 'products/:id' => "products#show", as: "product"
    end
  end

  get  'signup', to: 'users#new', as: 'signup'
  get  'login', to: 'sessions#new', as: 'login'
  get  'logout', to: 'sessions#destroy', as: 'logout'
  get 'pay/:amount/:email', to: 'orders#pay',  constraints: { email: /[^\/]+/}, as: "pay"
  # For details on the DSL available within this file, see https://guides.rubyonrails.org/routing.html

  post 'line_items/:id/add' => "line_items#add_quantity", as: "line_item_add"
  post 'line_items/:id/reduce' => "line_items#reduce_quantity", as: "line_item_reduce"
  post 'line_items' => "line_items#create"
  get 'line_items/:id' => "line_items#show", as: "line_item"
  delete 'line_items/:id' => "line_items#destroy"
end
