Rails.application.routes.draw do
  root to: 'admin/products#index'
  devise_for :users

  namespace :admin do
    resources :products
  end
  
  # For details on the DSL available within this file, see https://guides.rubyonrails.org/routing.html
end
