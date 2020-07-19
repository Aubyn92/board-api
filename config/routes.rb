Rails.application.routes.draw do
  resources :posts, only: %i[index create update destroy]
  post "/login", to: "user_token#create"
  get "/status", to: "status#index"
  get "/status/user", to: "status#user"
  post "/sign-up", to: "users#create"
end
