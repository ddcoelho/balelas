Rails.application.routes.draw do
  get 'reviews/new'
  get 'reviews/create'
  get 'users/:id/posts', to: "posts#indexByUser", :as => :user_posts
  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html

  devise_for :users
  root to: 'posts#index'

  resources :posts do
    resources :comments, only: [:new, :create]
  end
end
