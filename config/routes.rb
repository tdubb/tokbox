Rails.application.routes.draw do
  resources :appointments

  devise_for :users
  resources :users do
    resources :appointments
  end
  get 'home/index'
  root 'home#index'

  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html
end
