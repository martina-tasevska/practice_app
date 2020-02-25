Rails.application.routes.draw do
  resources :users, only: [:new, :create]

  get 'login', to: 'sessions#new'
  post 'login', to: 'sessions#create'
  get 'welcome', to: 'sessions#welcome'
  delete '/logout',  to: 'sessions#logout'
  delete '/destroy', to: 'tasks#destroy'
  root 'sessions#new'

  resources :users do
    resources :tasks
  end

end