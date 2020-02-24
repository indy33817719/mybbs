Rails.application.routes.draw do
  devise_for :users
  # get 'posts/index'
  # get 'posts/new'
  # get 'topics/index'
  # get 'topics/show'
  # get 'topics/new'
  # get 'topics/edit'
  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html

  devise_scope :user do
    authenticated :user do
      root :to => 'topics#index', as: :authenticated_root
    end
    unauthenticated :user do
      root :to => 'devise/sessions#new', as: :unauthenticated_root
    end
  end

  resources :topics do
    resources :posts
  end
  post 'topics/create' => 'topics#create'
end
