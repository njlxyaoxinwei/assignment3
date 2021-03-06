RedditDemo::Application.routes.draw do
  resources :sessions, only: [:new, :create, :destroy]
  resources :posts, only: [:create, :destroy, :show, :index]
  resources :users
  resources :votes, only: [:create, :destroy]
  resources :comments, only: [:create, :destroy]
  match '/home', to: 'static_pages#home'

  match '/about', to: 'static_pages#about'

  match '/contact', to: 'static_pages#contact'

  match '/signup', to: 'users#new'
  match '/signin', to: 'sessions#new'
  match '/signout', to: 'sessions#destroy', via: :delete


  root to: 'static_pages#home'
end