Rails.application.routes.draw do

  root 'static_pages#index'

  get 'about' => 'about#index'
  get 'contact' => 'contact#index'

  resources :posts

end
