Rails.application.routes.draw do
  get 'bookings/new'
  get 'bookings/create'
  get 'bookings/show'
  get 'bookings/destroy'
  resources :bookings, only: [:new, :create, :show, :destroy]
  get 'flights', to: 'flights#index'
  root 'flights#index' 
end
