Rails.application.routes.draw do
  get 'sessions/new'

  resources :users
  resources :events
  root 'welcome#index'

  get '/dashboard', to: 'users#show'

  get '/login', to: 'sessions#new'
  post '/login', to: 'sessions#create'
  delete '/logout', to: 'sessions#destroy'
end
