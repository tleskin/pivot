Rails.application.routes.draw do

  namespace :admin do
    resources :items
    resources :categories
  end

  resources :categories, only:[:index, :show]
  resources :items, only:[:show]
  resources :users
  resources :admins, only:[:show]

  get '/', to: 'unauth_sessions#show'
  root 'unauth_sessions#show'
  get '/login', to: 'sessions#new'
  post '/login', to: 'sessions#create'
  delete '/logout', to: 'sessions#destroy'
end
