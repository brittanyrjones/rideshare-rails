Rails.application.routes.draw do

  root 'home#index'

  resources :drivers

  resources :passengers do
    resources :trips, only: [:new ,:create]
  end

  resources :trips
  #don't need index for trips!!


end
