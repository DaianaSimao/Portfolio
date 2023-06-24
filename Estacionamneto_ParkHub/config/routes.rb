Rails.application.routes.draw do
  resources :estacionamentos
  resources :vagas
  resources :veiculos
  resources :precos
  resources :tickets
  get 'inicio/index'
  devise_for :funcionarios
  devise_for :admins
  root "inicio#index"
end
