Rails.application.routes.draw do
  resources :payperiods

  resources :timeentries

  resources :patients

  root 'timeentries#new'

  get 'search', to: 'search#search'
end
