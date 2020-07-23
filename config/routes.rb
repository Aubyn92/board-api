Rails.application.routes.draw do
  # resources :posts, only: %i[index create update destroy show]
  resources :posts
  put "/posts/image/:id", to: "posts#update_image"
  post "/login", to: "user_token#create"
  post "/sign-up", to: "users#create"
  put "/users", to: "users#update"
  get "/status", to: "status#index"
  get "/status/user", to: "status#user"
  get "/profile", to: "users#profile"
end
