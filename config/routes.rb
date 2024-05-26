Rails.application.routes.draw do
  root "home#index"

  resources :questions do
    resources :answers, only: %i[create]
  end
  resource :session, only: %i[new create destroy]
  resources :users
end
