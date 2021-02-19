Rails.application.routes.draw do
  get 'attendances/new'
  get 'attendances/create'
  root 'events#index'
  resources :events
  resources :users, only: [:index, :new, :show, :create]
  get 'signout' => 'logins#destroy', as: 'signout'
  resources :logins, only: [:new, :create]
end
