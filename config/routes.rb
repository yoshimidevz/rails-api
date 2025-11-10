Rails.application.routes.draw do
  get "auth/signin"
  get "auth/signup"
  get "up" => "rails/health#show", as: :rails_health_check

  resources :produtos, only: [:index, :create, :destroy, :show, :update]
end
