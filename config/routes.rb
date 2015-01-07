Rails.application.routes.draw do
  resources :patients

  root 'patients#index'

  get 'search', to: 'search#search'
end
