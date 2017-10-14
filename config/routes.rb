Rails.application.routes.draw do
    resources :attractions
    resources :sessions, only:[:new, :show, :create]
    get '/signin' => 'sessions#new'
    root 'welcome#index'
    post'/logout' => 'sessions#destroy', as: :logout
    post 'rides/:id' => 'rides#take_ride'
    resources :users do
      resources :attractions
    end

  end
