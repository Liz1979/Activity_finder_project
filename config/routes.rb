Rails.application.routes.draw do
  get 'pages/home'

  get 'pages/help'

  get 'activity_finder/index'

  resources :activity_types
  resources :users

  root 'activity_finder#index'
  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html
end
