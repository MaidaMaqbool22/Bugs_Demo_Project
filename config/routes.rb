Rails.application.routes.draw do
  resources :bugs
  devise_for :users
  resources :projects
  # get 'pages/home'
  root to: 'pages#home'
  get 'assign_projects', to: 'pages#assign_projects'
  get 'assignment', to: 'projects#assignment'
  get 'show_assing_pro', to: 'pages#show'
  get 'completed_pro', to: 'pages#completed_pro'
end
