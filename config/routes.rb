Rails.application.routes.draw do
  root "home#index"

  resources :questions

  resources :users, only: %i[new create]
end
