Rails.application.routes.draw do

  resources :sessions, only: [:create, :destroy]
  resources :job_seekers
  resources :profiles, only: [:index, :update, :show]
  resources :offers
  resources :payments
  resources :employers

  get '/my_offers/:id', to: 'job_seekers#myOffers'
  delete '/users', to: 'users#destroy'
  get '/users', to: 'users#index'
  post '/users/signup', to: 'users#create'
  post 'users/login', to: 'sessions#login'
  get 'users/me', to: 'users#show'
  delete 'users/logout', to: 'sessions#destroy'
  post "/stkpush", to: "payments#stkpush"
  post "/polling_payment", to: "payments#polling_payment"
  post '/callback', to: "payments#callback"

end
