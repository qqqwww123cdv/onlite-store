Rails.application.routes.draw do

  resources :checkouts do
  collection do
      post 'import'
    end
  end
  get 'cards/show'
  get "/admin", to: "admin/homepage#index"
  get "all_orders", to: "shops#orders"
  get "shops/categories", to: "shops#categories"
  post 'prom' => 'cards#prom'
  get "shops/about_us", to: "shops#about_us"
  get "shops/bonus", to: "shops#bonus"

  resources :shops, only:[:index, :show]
  resources :order_items
  resource :cards, only:[:show]

  devise_for :users

  namespace :admin do
    resources :categories
    resources :promocodes do
      collection do
        post 'import'
      end
    end
    resources :products do
      collection do
        delete 'discontinue'
        get 'delete_all'
        post 'import'
      end
    end
  end

  root "shops#index"
end
