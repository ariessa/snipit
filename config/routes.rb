Rails.application.routes.draw do
  devise_for :users
  resources :links
  resources :views, path: :snips, only: [:show]
  root "links#index"
  get '/about', to: 'about#index'
end
