Rails.application.routes.draw do

  

  get 'places/create'
  resources :places, only: [:index] do
    resources :reviews, only: [:new, :create]
  end

  devise_for :users
  root to: 'pages#home'
  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html
end
