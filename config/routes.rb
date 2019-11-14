Rails.application.routes.draw do
  
  get '/login', to: 'sessions#new', as: :login
  delete '/logout', to: 'sessions#delete', as: :logout
  
  resources :users do
    resources :posts
  end
  
  resources :sessions, :only => [:create, :new, :destroy]

  post 'posts/search', to: 'posts#search'

  resources :tags

  resources :posts do
    resources :comments
  end

  resources :comments

  # root 'static_pages#index'

  # For details on the DSL available within this file, see https://guides.rubyonrails.org/routing.html
end