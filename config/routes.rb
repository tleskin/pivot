Rails.application.routes.draw do

  namespace :admin do
    resources :items
  end

  get '/', to: 'unauth_sessions#show'


end
