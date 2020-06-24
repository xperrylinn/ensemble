Rails.application.routes.draw do
  resources :running_entries
  devise_for :users
  get 'welcome/index'
  get '/entries/new/:id', to: 'entries#new'
  # For details on the DSL available within this file, see https://guides.rubyonrails.org/routing.html
  resources :entries
  resources :activities
  root 'welcome#index'
end
