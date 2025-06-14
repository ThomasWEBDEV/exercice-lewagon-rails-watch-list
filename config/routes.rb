# config/routes.rb
Rails.application.routes.draw do
  root to: "lists#index"
  resources :lists, only: [:index, :show, :new, :create] do
    resources :bookmarks, only: [:new, :create] # Imbriqué pour 'new' et 'create'
  end
  resources :bookmarks, only: [:destroy] # Non imbriqué pour 'destroy'
end
