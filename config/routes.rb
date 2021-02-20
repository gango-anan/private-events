Rails.application.routes.draw do
  root 'events#index'
  resources :attendances, only: %i[new create]
  resources :events, only: %i[index new show create]
  resources :users, only: %i[index new show create]
  get 'signout' => 'logins#destroy', as: 'signout'
  resources :logins, only: %i[new create]
end
