Rails.application.routes.draw do
  devise_for :users

  root to:'posts#index'
  resources :posts do
    resources :likes, only: [:create, :destroy]
    resources :comments, only: :create
    collection do
      get 'search'
    end
  end
  resources :users, only: :show

  get '/post/area', to: "posts#area"

end
