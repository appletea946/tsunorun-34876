Rails.application.routes.draw do
  devise_for :users
  # For details on the DSL available within this file, see https://guides.rubyonrails.org/routing.html
  root "groups#index"
  resources :groups
  resources :users, only: [:index, :edit, :update, :show]
  resources :tags, only: [:index, :new, :create, :destroy]
end
