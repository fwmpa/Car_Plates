Rails.application.routes.draw do
  resources :car_plates, param: :plate
  root 'car_plates#index'
end
