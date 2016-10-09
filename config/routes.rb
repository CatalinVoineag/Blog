Rails.application.routes.draw do



  resources :users

  root 'static_pages#index'

  get 'about' => 'about#index'
  get 'contact' => 'contact#index'

  resources :posts, only: [:index, :show]

  # Admin Routes / Scoping
  scope :admin, admin_scope: true do 

    # This allows us to have /admin as a default index action
    # And then have all the items within it under the same path
    # We also use some cleverness of scope/namespace where we can set our own parameters

    get "/" => "admin#index", as: "admin_root", format: false

      get   'login'  => 'sessions#new'
      post   'login'  => 'sessions#create'
      delete 'logout' => 'sessions#destroy'

      get '/posts' => 'admin#posts', as: :admin_posts

      get    '/post/new'       => 'posts#new',     as: :admin_post_new
      post   '/post'           => 'posts#create',  as: :admin_post_create
      get    '/post/:id'       => 'posts#show',    as: :admin_post_show
      get    '/post/:id/edit'  => 'posts#edit',    as: :admin_post_edit
      patch  '/post/:id'       => 'posts#update',  as: :admin_post_update

  end

end
