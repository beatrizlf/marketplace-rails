Rails.application.routes.draw do
  get 'value/winning_bid'
  devise_for :users
  root to: 'pages#home'
  # For details on the DSL available within this file, see https://guides.rubyonrails.org/routing.html
  resources :pages, only: [:index, :show, :my_profile]
  resources :auctions
  resources :bids, only: [:index, :new, :create]
end
