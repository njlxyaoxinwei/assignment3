RedditDemo::Application.routes.draw do
  match '/home', to: 'static_pages#home'

  match '/about', to: 'static_pages#about'

  match '/contact', to: 'static_pages#contact'

  match '/signup', to: 'users#new'
  resources :users
  root to: 'users#index'
end