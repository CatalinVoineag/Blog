Rails.application.routes.draw do

  get   'login'  => 'sessions#new'
  post   'login'  => 'sessions#create'
  delete 'logout' => 'sessions#destroy'

  resources :users

  root 'static_pages#index'

  get 'about' => 'about#index'
  get 'contact' => 'contact#index'

  resources :posts

  # Admin Routes / Scoping
  scope :admin, admin_scope: true do 

    # This allows us to have /admin as a default index action
    # And then have all the items within it under the same path
    # We also use some cleverness of scope/namespace where we can set our own parameters

    get "/" => "admin#index", as: "admin_root", format: false

  end

end
