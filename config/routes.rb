Rails.application.routes.draw do
  resources :articles
  resources :users
  get 'homes/index'
end
