Rails.application.routes.draw do
  devise_for :users
  # For details on the DSL available within this file, see https://guides.rubyonrails.org/routing.html
  resources :users, only: [:index, :edit, :update, :show]
  root "groups#index"
  resources :groups do
    resources :comments, only: [:create, :destroy]
    resources :user_group_relations, only: [:create, :destroy]
  end
  resources :tags, only: [:index, :new, :create, :destroy]
end
