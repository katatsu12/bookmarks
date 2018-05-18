Rails.application.routes.draw do
  resources :bookmarks

  root 'bookmarks#index'

  match 'auth/:provider/callback', to: 'sessions#create', via: :all
  match 'auth/failure', to: redirect('/'), via: :all
  match 'singout', to: 'sessions#destroy', as: 'singout', via: :all
end
