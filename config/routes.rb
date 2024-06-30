Rails.application.routes.draw do
  resources :links
  resources :views, path: :snips, only: [:show]
  root "links#index"
  get '/about', to: 'about#index'
  get '/stats', to: 'stats#index'
end
