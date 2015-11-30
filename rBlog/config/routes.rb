Rails.application.routes.draw do
  get 'contact' => 'contacts#new'

  get 'contacts/create'

  get 'about' => 'about#index'

  resources :comments, only: [:new]
  # get 'comments/new'
  
  # get 'categories/show'
  resources :categories, only: [:show]
  resources :posts, only: [:index, :show]
  # get 'posts/index'
  # get 'posts/show'

  namespace :admin do
    resources :sessions, only: [:new, :create]
    # get 'sessions/new'
    # get 'sessions/create'
  end

  namespace :admin do
    resources :users 
    # get 'users/new'
    # get 'users/create'
    # get 'users/edit'
    # get 'users/update'
    # get 'users/destroy'
    # get 'users/index'
    # get 'users/show'
  end
  
  namespace :admin do
    resources :comments
    # get 'comments/new'
    # get 'comments/create'
    # get 'comments/index'
    # get 'comments/show'
    # get 'comments/destroy'
    # get 'comments/update'
  end
  
  namespace :admin do
    resources :categories
    # get 'categories/new'
    # get 'categories/create'
    # get 'categories/edit'
    # get 'categories/update'
    # get 'categories/destroy'
    # get 'categories/index'
    # get 'categories/show'
  end

  namespace :admin do
      resources :posts
      # get 'posts/new'
      # get 'posts/create'
      # get 'posts/show'
      # get 'posts/edit'
      # get 'posts/index'
      # get 'posts/update'
      # get 'posts/destroy'
  end



  # The priority is based upon order of creation: first created -> highest priority.
  # See how all your routes lay out with "rake routes".

  # You can have the root of your site routed with "root"
  root 'posts#index'

end
