Rails.application.routes.draw do

  get '/login', to: 'sessions#new'
  post '/login', to: 'sessions#create'
  get '/logout', to: 'sessions#destroy'
  resources :activity_types
  resources :attractions
  resources :users, except: [:new]
  get '/signup', to: 'users#new', as: :new_user
  root 'activity_finder#index'
  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html
end
