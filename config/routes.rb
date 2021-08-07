Rails.application.routes.draw do
  resources :comments
  resources :posts do
    resources :comments
  end
  resources :boards
  devise_for :users
  # For details on the DSL available within this file, see https://guides.rubyonrails.org/routing.html
  resources :home
  resources :about
  root "home#index"
  get 'users/:id' => 'users#show'

  namespace :users do
    root :to => "home#index"
  end
end
