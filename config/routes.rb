Rails.application.routes.draw do
  get 'collaborator/index'

  get 'collaborator/create'

  get 'collaborator/destroy'

  resources :wikis

  resources :charges, only: [:new, :create]

  resources :downgrade, only: [:new, :create]

  devise_for :users

  get 'about' => 'welcome#about'

  root to: 'welcome#index'
end
