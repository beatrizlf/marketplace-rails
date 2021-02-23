Rails.application.routes.draw do
  devise_for :users
  root to: 'pages#home'
  # For details on the DSL available within this file, see https://guides.rubyonrails.org/routing.html
  resources :pages, only: [:index, :show, :my_profile]
  resources :auctions, except: [:update, :destroy]
  resources :bids, only: [:index, :new, :create]

  post 'start_auction', to: "auctions#start_auction"
end
