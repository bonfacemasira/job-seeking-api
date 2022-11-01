Rails.application.routes.draw do

  resources :sessions, only: [:create, :destroy]
  resources :job_seekers
  resources :profiles, only: [:index, :update, :show]
  resources :offers
  resources :payments
  resources :employers

  get '/users', to: 'users#index'
  post '/users/signup', to: 'users#create'
  post 'users/login', to: 'sessions#create'
  get 'users/me', to: 'users#show'
  delete '/logout', to: 'sessions#destroy'

  #   devise_for :users,:controllers => {
#     :registrations => 'user/registrations', :sessions => "user/sessions", :defaults => { :format => 'json' },
# }
#  resources :users, only: [:index, :show, :destroy, :create]

end
