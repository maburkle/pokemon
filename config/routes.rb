Rails.application.routes.draw do
  devise_for :users
  root 'cards#index'

  resources :cards
  resources :card_sets
  resources :series
end
