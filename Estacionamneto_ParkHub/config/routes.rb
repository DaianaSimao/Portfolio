Rails.application.routes.draw do
  get 'inicio/index'
  devise_for :funcionarios
  devise_for :admins
  root "inicio#index"
end
