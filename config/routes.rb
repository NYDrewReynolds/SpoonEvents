Rails.application.routes.draw do
  get 'sessions/new'

  resources :users
  resources :events
  root 'welcome#index'

  get '/login', to: 'sessions#new'
  post '/login', to: 'sessions#create'
  delete '/logout', to: 'sessions#destroy'
end
