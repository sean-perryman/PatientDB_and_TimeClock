Rails.application.routes.draw do
  get "health_check" => "health_check#index"

  resources :payperiods, :timeentries, :patients, :users

  get 'search', to: 'search#search'

	get "/log-in" => "sessions#new"
	post "/log-in" => "sessions#create"
	get "/log-out" => "sessions#destroy", as: :log_out

  root 'timeentries#new'
end
