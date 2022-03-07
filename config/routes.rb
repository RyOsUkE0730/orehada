Rails.application.routes.draw do
  devise_for :users
  root to: "items#index"
  resources :users, only: :show
  resources :items, only: [:index, :new, :create, :show, :destroy] do
    resources :likes, only: [:create, :destroy]
  end
end
