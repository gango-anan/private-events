Rails.application.routes.draw do
  root 'events#index'
  resources :events
  resources :users, only: [:new, :show, :create]
  get 'signout' => 'logins#destroy', as: 'signout'
  resources :logins, only: [:new, :create]
end
