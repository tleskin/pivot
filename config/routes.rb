Rails.application.routes.draw do

  namespace :admin do
    resources :items
    resources :categories
  end

  resources :categories, only:[:index, :show]
  resources :items, only:[:show]
  resources :users
  resources :admins, only:[:show]
  resources :orders, only:[:show, :index, :new, :create]
  resources :purchases, only:[:create]
  resources :carts, only:[:show]

  post '/orders/:id', to: 'orders#create'
  post '/add_item', to: 'carts#add_item'
  post '/subtract_item', to: 'carts#subtract_item'
  post '/remove_item', to: 'carts#remove_item'
  get '/', to: 'unauth_sessions#show'
  root 'unauth_sessions#show'
  get '/login', to: 'sessions#new'
  post '/login', to: 'sessions#create'
  delete '/logout', to: 'sessions#destroy'
end
