Rails.application.routes.draw do
  devise_for :users
  root :to => 'homes#top'
  
  get '/post_images' => 'post_images#index', as: 'post_images'
  resources :post_images, only: [:new, :create, :index, :show, :destroy]
  resources :users, only: [:show, :edit]
  
  get '/homes/about' => 'homes#about', as: 'about'
  # For details on the DSL available within this file, see https://guides.rubyonrails.org/routing.html
end
