Rails.application.routes.draw do
  get 'trip/show'

  get 'trip/edit'

  get 'trip/update'

  get 'trip/index'

  get 'trip/delete'

  get 'trip/create'

  get 'trip/new'

  get 'driver/index'

  get 'driver/new'

  get 'driver/create'

  get 'driver/update'

  get 'driver/edit'

  get 'driver/show'

  get 'driver/delete'

  get 'passengerindex/new'

  get 'passengerindex/create'

  get 'passengerindex/edit'

  get 'passengerindex/update'

  get 'passengerindex/show'

  get 'passengerindex/delete'

  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html


  resources :drivers
end
