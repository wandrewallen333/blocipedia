Rails.application.routes.draw do


  resources :collaborators
  resources :wikis

  resources :charges, only: [:new, :create]

  resources :downgrade, only: [:new, :create]

  devise_for :users

  get 'about' => 'welcome#about'

  root to: 'welcome#index'
end
