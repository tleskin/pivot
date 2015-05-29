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

  resources :regions,     only: [:index, :show, :create, :new]
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

end
