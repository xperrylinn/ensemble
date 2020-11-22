Rails.application.routes.draw do
  get 'strava/exchange_token'
  get '/running_entries/new_from_strava/:id', to: 'running_entries#new_from_strava'
  resources :running_entries
  resources :lifting_entries
  resources :exercises
  devise_for :users
  get 'welcome/index'
  get '/entries/new/:id', to: 'entries#new'
  # For details on the DSL available within this file, see https://guides.rubyonrails.org/routing.html
  resources :entries
  resources :activities
  root 'welcome#index'
  get '/user_entries/:id', to: 'entries#user_index', as: 'entries_by_user'
end
