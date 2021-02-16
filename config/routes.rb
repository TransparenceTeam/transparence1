Rails.application.routes.draw do
  devise_for :users
  # For details on the DSL available within this file, see https://guides.rubyonrails.org/routing.html
  root to: 'pages#home'

  resources :posts, only: [:index, :show, :new, :update] do
    resources :user_posts, only: [:index, :new, :create]
  end

  resources :politicians, only:[:show]

  resources :users, only: [:show]

  resources :posts, only: [:destroy]
end
