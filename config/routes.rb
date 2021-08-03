Rails.application.routes.draw do
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
