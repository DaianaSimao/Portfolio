Rails.application.routes.draw do
  resources :vagas
  resources :precos
  resources :tickets
  get 'inicio/index'
  devise_for :funcionarios
  devise_for :admins
  root "inicio#index"
end
