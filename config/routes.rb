Rails.application.routes.draw do

  root 'home#index'

  resources :drivers

  resources :passengers do
    resources :trips, only: [:create]
  end

  resources :trips, except: [:create]
  #don't need index for trips!!


end
