Rails.application.routes.draw do
  devise_for :users,:controllers => {
    :registrations => 'user/registrations', :sessions => "user/sessions", :defaults => { :format => 'json' },
}
 resources :users, only: [:index, :show, :destroy, :create]
 resources :sessions, only: [:create, :destroy]
 resources :job_seekers
 resources :profiles, only: [:update]
 resources :offers
 resources :payments
 resources :employers

end
