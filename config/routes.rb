Rails.application.routes.draw do
  get "up" => "rails/health#show", as: :rails_health_check

  get "/produtos", to: "produtos#index"
  post "/produtos", to: "produtos#create"
  resources :produtos
end
