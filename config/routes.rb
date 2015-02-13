Rails.application.routes.draw do
  resources :payperiods
  resources :timeentries
  resources :patients

  get 'search', to: 'search#search'

  resources :users
  
	get "/log-in" => "sessions#new"
	post "/log-in" => "sessions#create"
	get "/log-out" => "sessions#destroy", as: :log_out

  root 'timeentries#new'
end
