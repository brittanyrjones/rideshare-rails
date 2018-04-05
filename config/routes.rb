Rails.application.routes.draw do
root 'home#index'

resources :drivers
resources :passengers do
  resources :trips, only: [:create]
end

resources :trips do
end

end
