Rails.application.routes.draw do

  resources :places, only: [:index, :show] do
    resources :reviews, only: [:new, :create]
    resources :wishlists_places, only: [:new, :create, :destroy]
  end

  resources :wishlists, only: [:index, :new, :create, :destroy]
  


  devise_for :users,
    controllers: { omniauth_callbacks: 'users/omniauth_callbacks' }
  root to: 'pages#home'
  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html
end
