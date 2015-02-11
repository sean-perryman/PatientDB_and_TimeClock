Rails.application.routes.draw do
  devise_for :users
  resources :patients

  root 'patients#index'

  get 'search', to: 'search#search'
end
