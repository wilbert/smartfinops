Rails.application.routes.draw do
  resources :compliences
  resources :apps do
    resources :cloud_stacks, shallow: true
  end

  devise_for :users
  resources :owners

  root to: 'homes#index'
end
