Rails.application.routes.draw do

  get 'products/index'

  root to: 'pages#home'

  resources :places, only: [:index, :show] do
    resources :reviews, only: [:new, :create]
    resources :wishlists_places, only: [:new, :create, :destroy]
  end

  resources :wishlists, only: [:index, :new, :create, :destroy]
  resources :products, only: [:index]

  get 'messengerbot/webhook', to: 'facebook_messenger_bot#chalenge'
  post 'messengerbot/webhook', to: 'facebook_messenger_bot#webhook'

  resources :orders, only: [:index, :show, :create] do
    resources :payments, only: [:new, :create]
  end


  devise_for :users,
    controllers: { omniauth_callbacks: 'users/omniauth_callbacks' }
  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html
end
