Rails.application.routes.draw do
  resources :bugs
  devise_for :users
  resources :projects
  # get 'pages/home'
  root to: 'pages#home'
end
