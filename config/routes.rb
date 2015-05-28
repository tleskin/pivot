Rails.application.routes.draw do

  namespace :regional_admin do
    resources :businesses, only: [:index, :show, :destroy]
    resources :users, only: [:index, :new, :destroy, :create]
    resources :region, only: [:show, :edit, :update]
  end

  namespace :regions, as: :region, path: '/:region' do
    resources :businesses, only: [:index, :show]
  end


  namespace :regions, as: :region, path: '/:region' do
    resources :businesses, only: [:index, :show]
  end

  resources :regions,     only: [:index, :show]
  resources :portfolio,   only: [:show]
  resources :categories,  only: [:index, :show]
  resources :prospects,   only: [:index, :show, :create]
  resources :investments, only: [:show, :index, :new, :create, :update]

  post '/prospects_update', to: 'prospects#update'

  get        '/home', to: 'static_pages#home'
  get       '/about', to: 'static_pages#about'
  get     '/contact', to: 'static_pages#contact'

  get '/modal_login', to: 'sessions#modal_login'

  get       '/login', to: 'sessions#new'
  post      '/login', to: 'sessions#create'
  delete   '/logout', to: 'sessions#destroy'

  resources :users

  root 'static_pages#home'


  # namespace :admin do
  #   resources :items
  #   resources :categories
  #   get '/orders', to: 'orders#index'
  #   get '/:id', to: 'admins#show'
  #   namespace :items do
  #     put '/:id', to: 'items#retire'
  #   end
  #   namespace :categories do
  #     patch '/:id', to: 'categories#update'
  #   end
  #   get '/orders/completed', to: 'orders#completed'
  #   get '/orders/ordered', to: 'orders#ordered'
  #   get '/orders/cancelled', to: 'orders#cancelled'
  #   get '/orders/paid', to: 'orders#paid'
  #   resources :orders, only:[:show, :index, :update, :patch]
  # end

  # resource  :admin, only:[:show]
  # resources :reviews
  # resources :categories, only:[:index, :show]
  # resources :items, only:[:show]

  # resources :purchases, only:[:create]
  # resources :carts, only:[:show]

  # post '/orders/:id', to: 'orders#create'
  # post '/add_item', to: 'carts#add_item'
  # post '/subtract_item', to: 'carts#subtract_item'
  # post '/remove_item', to: 'carts#remove_item'

  # get '/login', to: 'sessions#new'
  # post '/login', to: 'sessions#create'
  # delete '/logout', to: 'sessions#destroy'
end
