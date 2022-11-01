Rails.application.routes.draw do
  devise_for :users,:controllers => {
    :registrations => 'user/registrations', :sessions => "user/sessions", :defaults => { :format => 'json' },
}
 resources :users, only: [:index, :show, :destroy, :create]
 resources :sessions, only: [:create, :destroy]
 resources :job_seekers
 resources :profiles, only: [:index, :update, :show]
 resources :offers
 resources :payments
 resources :employers
get '/me', to: "users#loggedIn"
post "/stkpush", to: "payments#stkpush"
post "/polling_payment", to: "payments#polling_payment"
post '/callback', to: "payments#callback"
end
