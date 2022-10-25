Rails.application.routes.draw do
  resources :offers
  resources :payments
  resources :job_seekers
  resources :employers
  devise_for :users,:controllers => {
    :registrations => 'user/registrations', :defaults => { :format => 'json' },
}
 resources :users, only: [:index, :show, :destroy]
 resources :sessions, only: [:create, :destroy]
  
end
