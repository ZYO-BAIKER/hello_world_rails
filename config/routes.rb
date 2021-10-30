Rails.application.routes.draw do
  resources :articles
  get 'users/index'
  get 'homes/index'
end
