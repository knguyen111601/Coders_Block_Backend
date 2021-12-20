Rails.application.routes.draw do
  get 'pages/index'
  resources :images
  resources :paragraphs
  resources :blogs
  resource :users, only: [:create]
  post "/login", to: "users#login"
  get "/auto_login", to: "users#auto_login"
  post "/signup" to: "users#create"
  end 

  root 'pages#index'
  namespace :api do
    namespace :v1 do
      resources :images
      resources :paragraphs
      resources :blogs
    end
  end


  get '*path', to: 'pages#index', via: :all
end
