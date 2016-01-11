Rails.application.routes.draw do
  get 'contact' => 'contacts#new'
  get 'contacts/create'
  get 'about' => 'about#index'
 
  resources :categories, only: [:show]
  resources :posts do
  	resources :comments, only: [:show, :create, :index]
  end

  namespace :admin do
    get "login" => "sessions#new", :as => "login"
  end
  namespace :admin do
    get "logout" => "sessions#destroy", :as => "logout"
  end
  namespace :admin do
    resources :sessions, only: [:create, :destroy]
  end
  namespace :admin do
    resources :users, only: [:new, :create, :edit, :update, :destroy, :index, :show]
  end
  
  resources :comments, only: [:new]
  namespace :admin do
    resources :comments, only: [:destroy]
  end
  
  namespace :admin do
    resources :categories, only: [:new, :create, :edit, :update, :destroy, :index, :show]
  end
  resources :categories, only: [:show]

  namespace :admin do
    resources :posts, only: [:new, :create, :edit, :update, :destroy, :index, :show]
  end
  resources :posts, only: [:index, :show]
  resources "contacts", only: [:new, :create]


  # The priority is based upon order of creation: first created -> highest priority.
  # See how all your routes lay out with "rake routes".

  # You can have the root of your site routed with "root"
  root 'posts#index'

end
