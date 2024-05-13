Rails.application.routes.draw do
  root "home#index"

  resources :questions
  resource :session, only: %i[new create destroy]
  resources :users, only: %i[new create show edit update index]
end
