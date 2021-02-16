Rails.application.routes.draw do
  resources :events
  root 'users#index'
  resources :users, only: [:new, :show, :create]
  get 'signout' => 'logins#destroy', as: 'signout'
  resources :logins, only: [:new, :create]
end
