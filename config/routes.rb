Rails.application.routes.draw do
  
  get '/login', to: 'sessions#new', as: :login
  delete '/logout', to: 'sessions#delete', as: :logout
  
  resources :users, :only => [:create, :new, :show, :edit, :update, :destroy] do
    resources :posts, :only => [:new, :create, :edit, :update, :destroy, :show]
  end
  resources :sessions, :only => [:create, :new, :destroy]
  resources :tags, :only => [:create, :destroy]
  resources :posts do
  resources :comments, :only => [:create, :show, :new, :index]
  end
 
 

  # root 'static_pages#index'

  # For details on the DSL available within this file, see https://guides.rubyonrails.org/routing.html
end