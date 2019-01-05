Rails.application.routes.draw do
  root 'cards#index'

  resources :cards
  resources :card_sets
  resources :series
end
