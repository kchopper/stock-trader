Rails.application.routes.draw do
  devise_for :users, :controllers => { :registrations => 'user/registrations' }
  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html
  root to: 'welcomes#index'
  get 'my_portfolio',   to: 'users#my_portfolio'
  get 'search_stocks',  to: 'stocks#search'
  get 'my_friends',     to: 'users#my_friends'
  get 'search_friends', to: 'users#search'

  resources :users, only:[:show]
  resources :friendsips
  resources :user_stocks, only: [:create, :destroy]
end
