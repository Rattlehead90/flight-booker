Rails.application.routes.draw do
  resources :bookings, only: [:new, :create, :show, :destroy]
  get 'flights', to: 'flights#index'
  root 'flights#index' 
end
