# config/routes.rb
Rails.application.routes.draw do
  root to: "lists#index"
  resources :lists, only: [:index, :show, :new, :create, :edit, :update] do # <-- MODIFIÉ ICI
    resources :bookmarks, only: [:create]
    resources :reviews, only: [:new, :create]
  end
  resources :bookmarks, only: [:destroy]
end
