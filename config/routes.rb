Rails.application.routes.draw do
  root to: 'pages#home'

  resources :bugs
  devise_for :users
  resources :projects do
    collection do
      get 'assignment'
    end
  end
  resources :pages do
    collection do
      get 'assign_projects'
      get 'completed_pro'
    end
  end
  # get 'pages/home'
end
