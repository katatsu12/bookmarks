Rails.application.routes.draw do
  resources :friendships
  get 'users/index'
  get 'users/show'
  get 'users/friends_bookmark'

  resources :bookmarks
  resources :users, only: [:show]

  root 'bookmarks#index'

  get 'auth/:provider/callback', to: 'sessions#create'

  match 'sign_out', to: 'sessions#destroy', as: 'sign_out', via: :all
end
