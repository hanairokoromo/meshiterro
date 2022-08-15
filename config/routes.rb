Rails.application.routes.draw do
  devise_for :users
  root :to => 'homes#top'
  
  get '/post_images' => 'post_images#index', as: 'post_images'
  resources :post_images, only: [:new, :create, :index, :show, :destroy] do
    resource :favorites, only: [:create, :destroy]
    resources :post_comments, only: [:create, :destroy]
  end
  
  get 'users/:id/edit' => 'users#edit', as: 'edit_users'
  resources :users, only: [:show, :edit, :update]
  
  get '/homes/about' => 'homes#about', as: 'about'
  # For details on the DSL available within this file, see https://guides.rubyonrails.org/routing.html
end
