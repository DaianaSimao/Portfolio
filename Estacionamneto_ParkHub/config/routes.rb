Rails.application.routes.draw do
  devise_for :users
  devise_scope :user do
    get '/users/sign_out' => 'devise/sessions#destroy'
  end
  resources :estacionamentos
  resources :vagas
  resources :veiculos
  resources :precos
  resources :tickets
  get 'inicio/index'
  root "inicio#index"
end
