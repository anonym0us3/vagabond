
Rails.application.routes.draw do


  root to: "pages#home"
  # splash page
  get '/', to: 'pages#home'

  # User routes
  get "/users", to: "users#index", as: "users"
  get "/users/new", to: "users#new", as: "new_user"
  post "/users", to: "users#create"
  get "/users/:id", to: "users#show", as: "user"
  get "/users/:id/edit", to: "users#edit", as: "edit_user"
  patch "/users/:id", to: "users#update"
  
  get "/login", to: "sessions#new"
  get "/logout", to: "sessions#destroy"
  post "/sessions", to: "sessions#create"

  get "/posts", to: "posts#index", as: "posts"
  get "/cities/:id/posts/new", to: "posts#new", as: "new_post"
  post "/posts", to: "posts#create", as: 'post_create'
  get "/posts/:id", to: "posts#show", as: "post"
  get "/posts/:id/edit", to: "posts#edit", as: "edit_post"
  patch "/posts/:id", to: "posts#update"
  delete "/posts/:id", to: "posts#destroy", as: "delete_post"

  get '/cities', to: 'cities#index'
  get '/cities/new', to: 'cities#new'
  post '/cities', to: 'cites#create'
  get '/cities/:id', to: 'cities#show', as: 'city'
end
