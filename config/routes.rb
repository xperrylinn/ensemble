Rails.application.routes.draw do
  get 'strava/exchange_token'
  resources :running_entries
  resources :lifting_entries
  resources :exercises
  devise_for :users
  get 'welcome/index'
  get '/entries/new/:id', to: 'entries#new'
  get '/running_entries/new/:id', to: 'running_entries#new_from_strava'
  # For details on the DSL available within this file, see https://guides.rubyonrails.org/routing.html
  resources :entries
  resources :activities
  root 'welcome#index'
end
