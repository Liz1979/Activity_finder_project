Rails.application.routes.draw do

  root 'activity_finder#index'
  get '/login', to: 'sessions#new'
  post '/login', to: 'sessions#create'
  get '/logout', to: 'sessions#destroy'
  resources :activity_types
  resources :locations
  resources :attractions
  resources :users, except: [:new]
  get '/signup', to: 'users#new', as: :new_user
  get '/help', to: 'pages#help'
  get '/home', to: 'pages#home'

  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html
end
