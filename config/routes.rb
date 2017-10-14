Rails.application.routes.draw do

  root 'welcome#index'
  resources :attractions
  resources :sessions, only:[:new, :show, :create]
  get '/signin' => 'sessions#new'
  post'/logout' => 'sessions#destroy', as: :logout

  resources :users do
    resources :attractions
  end


end
