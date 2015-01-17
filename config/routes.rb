Rails.application.routes.draw do
  resources :articles do
    resources :reviews
  end

  mount Upmin::Engine => '/admin'
  root to: 'visitors#index'
  devise_for :users
  resources :users
end
