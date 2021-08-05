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

  namespace :admin do
    get 'customers/index'
    get 'customers/show'
  end
  namespace :admin do
    get 'genres/index'
  end
  namespace :admin do
    get 'shops/index'
    get 'shops/new'
    get 'shops/show'
  end
  namespace :admin do
    get 'items/index'
    get 'items/new'
    get 'items/show'
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
  get 'items/index'
  get 'items/show'
  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html
  root to: 'homes#top'
  get 'homes/about'  => 'homes#about'
end
