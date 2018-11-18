

Rails.application.routes.draw do
  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html

  devise_for :users
  root to: 'posts#index'

  resources :posts do
    resources :comments, only: [:new, :create, :update, :edit, :index]
  end
end
