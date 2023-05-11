Rails.application.routes.draw do
  namespace :site do
    get 'welcome/index'
  end
  namespace :users_backoffice do
    get 'welcome/index'
  end
  namespace :admins_backoffice do
    get 'welcome/index' #dashboard
    resources :admins, only: [:index, :edit, :update] #administradores
  end
  devise_for :admins
  devise_for :users

  get 'inicio', to: 'site/welcome#index'

  root to: 'site/welcome#index'
end
