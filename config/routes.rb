Rails.application.routes.draw do
  resources :users do
    resources :attractions
  end
  resources :sessions


end
