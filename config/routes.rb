Rails.application.routes.draw do
  resources :bookmarks

  root 'bookmarks#index'

  match 'auth/:provider/callback', to: 'sessions#create', via: :all
  match 'auth/failure', to: redirect('/'), via: :all
  match 'sing_out', to: 'sessions#destroy', as: 'sing_out', via: :all
end
