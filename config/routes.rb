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
get 'homes/about'  => 'homes#about'

  resources :addresses, only: [:index, :edit, :create, :update, :destroy]
  resources :items, only: [:index, :show]

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



  get 'shops/index'
  get 'shops/show'
  get 'orders/new'
  get 'orders/confirm'
  get 'orders/complete'
  get 'orders/index'
  get 'orders/show'
  get 'customers/show'
  get 'addresses/index'
  get 'cart_items/index'
  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html

end
