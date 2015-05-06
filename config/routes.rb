Rails.application.routes.draw do

  namespace :admin do
    resources :items
    resources :categories
    get '/orders', to: 'orders#index'
    get '/:id', to: 'admins#show'
    namespace :items do
      put '/:id', to: 'items#retire'
    end
    namespace :categories do
      patch '/:id', to: 'categories#update'
    end
    get '/orders/completed', to: 'orders#completed'
    get '/orders/ordered', to: 'orders#ordered'
    get '/orders/cancelled', to: 'orders#cancelled'
    get '/orders/paid', to: 'orders#paid'
    resources :orders, only:[:show, :index, :update, :patch]
  end

  resource  :admin, only:[:show]
  resources :reviews
  resources :categories, only:[:index, :show]
  resources :items, only:[:show]
  resources :users
  resources :orders, only:[:show, :index, :new, :create, :update]
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
