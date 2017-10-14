Rails.application.routes.draw do

  root 'static#root'
  resources :attractions  
  resources :sessions, only:[:new, :show, :create]
  get '/signin' => 'sessions#new'
  post'/logout' => 'sessions#destroy', as: :logout
  
  resources :users do
    resources :attractions
  end


end
