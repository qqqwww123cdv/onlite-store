Rails.application.routes.draw do

  resources :checkouts
  get 'cards/show'
  get "/admin", to: "admin/homepage#index"
  post 'prom' => 'cards#prom'

  resources :shops, only:[:index, :show]
  resources :order_items
  resource :cards, only:[:show]

  devise_for :users

  namespace :admin do
    resources :promocodes
    resources :products do
      collection do
        delete 'discontinue'
        get 'delete_all'
      end
    end
  end

  root "shops#index"
end
