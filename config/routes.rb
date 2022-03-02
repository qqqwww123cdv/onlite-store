Rails.application.routes.draw do

  resources :shops, only:[:index, :show]
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
