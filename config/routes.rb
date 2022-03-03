Rails.application.routes.draw do

  get 'cards/show'
  resources :shops, only:[:index, :show]
  resources :order_items
  resource :cards, only:[:show]

  devise_for :users

  scope '/admin' do
    resources :products do
      collection do
        delete 'discontinue'
        get 'delete_all'
      end
    end
  end

  root "shops#index"
end
