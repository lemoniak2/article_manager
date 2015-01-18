Rails.application.routes.draw do
  get 'roles/index'

  get 'roles/show'

  get 'roles/create'

  get 'roles/update'

  get 'roles/destroy'

  resources :articles do
    resources :reviews
  end
  mount Upmin::Engine => '/admin'
  root to: 'visitors#index'
  devise_for :users

  resources :users do
    resources :user_roles, only: [:create, :update, :destroy], as: :roles
  end
  resources :roles
end
