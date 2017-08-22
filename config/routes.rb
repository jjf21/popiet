Rails.application.routes.draw do

  resources :places, only: [:index, :show] do
    resources :reviews, only: [:new, :create]
  end

  resources :wishlists, only: [:index, :new, :create, :destroy]

  devise_for :users
  root to: 'pages#home'
  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html
end
