Rails.application.routes.draw do

  get   'login'  => 'sessions#new'
  post   'login'  => 'sessions#create'
  delete 'logout' => 'sessions#destroy'

  resources :users

  root 'static_pages#index'

  get 'about' => 'about#index'
  get 'contact' => 'contact#index'

  resources :posts


end
