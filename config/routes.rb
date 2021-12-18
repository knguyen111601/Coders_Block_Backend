Rails.application.routes.draw do
  get 'pages/index'
  resources :images
  resources :paragraphs
  resources :blogs
  resource :users, only: [:create]
  post "/login", to: "users#login"
  get "/auto_login", to: "users#auto_login"

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
