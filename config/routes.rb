Rails.application.routes.draw do

  namespace :admin do
    get 'homes/top'
  end
  devise_for :admins, controllers: {
  sessions:      'admins/sessions',
  passwords:     'admins/passwords',
  registrations: 'admins/registrations'
}
  devise_for :customers, controllers: {
  sessions:      'customers/sessions',
  passwords:     'customers/passwords',
  registrations: 'customers/registrations'
}

root to: 'homes#top'
get 'about'  => 'homes#about'

  resources :addresses, only: [:index, :edit, :create, :update, :destroy]
  resources :items, only: [:index, :show]
  resources :shops, only: [:index, :show] do
    resources :comments, only: [:create, :destroy]
    resource :favorites, only: [:create, :destroy]
  end

  resources :cart_items, only: [:index, :create, :destroy, :update] do
    collection do
      delete 'destroy_all'
    end
  end
  resources :orders, only: [:index, :create, :destroy, :update, :new, :show]
  post 'orders/confirm' => 'orders#confirm'
  get 'orders/confirms' => 'orders#confirms'
  get 'orders/complete' => 'orders#complete'

  resources :addresses, only: [:index, :edit, :create, :update, :destroy]

  get 'customer' => 'customers#show'
  get 'customer/edit' => 'customers#edit'
  patch 'customer/' => 'customers#update', as: 'update_customer'
  get 'customer/unsubscribe' => 'customers#unsubscribe', as: 'confirm_unsubscribe'
  patch 'customer/withdraw' => 'customers#withdraw', as: 'withdraw_customer'
  put 'customer/withdraw' => 'customers#withdraw'


  namespace :admin do
    root to: "homes#top"
    get '/index/:id' => 'homes#index'
    resources :items, only: [:index, :new, :create, :show, :edit, :update]
    resources :shops, only: [:index, :new, :create, :show, :edit, :update]
    resources :genres, only: [:index, :create, :edit, :update]
    resources :customers, only:[:index, :show, :edit, :update]
    resources :orders, only: [:show, :update]
    resources :order_details, only: [:update]
    post 'order_details/:id' => 'orders#show'
  end

  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html

end
