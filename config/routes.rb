Rails.application.routes.draw do
  root 'events#index'
  resources :attendances, only: [:new, :create]
  resources :events, only: [:index, :new, :show, :create]
  resources :users, only: [:index, :new, :show, :create]
  get 'signout' => 'logins#destroy', as: 'signout'
  resources :logins, only: [:new, :create]
end
