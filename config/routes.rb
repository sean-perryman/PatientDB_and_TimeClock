Rails.application.routes.draw do
  resources :payperiods

  resources :timeentries

  devise_for :users
  resources :patients

  root 'timeentries#new'

  get 'search', to: 'search#search'
end
