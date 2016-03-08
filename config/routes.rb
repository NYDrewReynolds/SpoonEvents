Rails.application.routes.draw do
  get 'sessions/new'

  resources :users
  # resources :events

  resources :events do
    post 'create_registration', to: 'events#create_registration'
    # resources :registrations
  end
  root 'welcome#index'

  get '/login', to: 'sessions#new'
  post '/login', to: 'sessions#create'
  delete '/logout', to: 'sessions#destroy'
end
