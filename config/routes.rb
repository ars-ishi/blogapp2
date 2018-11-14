Rails.application.routes.draw do
  mount RailsAdmin::Engine => '/admin', as: 'rails_admin'
  devise_for :users
  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html
  root 'articles#index'
  resources :articles
  resources :users, only: [:show, :edit, :update] do
    member{get 'post_articles'}
    member{get 'favorite_articles'}
  end
end
