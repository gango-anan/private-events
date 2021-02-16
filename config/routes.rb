Rails.application.routes.draw do
  root 'users#index'
  resources :users, only: [:new, :show, :create]
  get 'logout' => 'logins#destroy', as: 'logout'
  resources :logins, only: [:new, :create]
end
