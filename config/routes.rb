Rails.application.routes.draw do
  devise_for :users
  root 'cards#index'

  resources :user_cards
  resources :cards
  resources :card_sets
  resources :series
  resources :users do
  	get '/cards', :action => :cards
  end
end
