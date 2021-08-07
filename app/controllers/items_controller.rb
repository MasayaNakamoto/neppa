class ItemsController < ApplicationController
  def index
    @items = Item.order(id: :desc).page(params[:page]).reverse_order
    if customer_signed_in?
      @customer = Customer.find(current_customer.id)
    else
      @customer = Customer
    end
  end

  def show
    if customer_signed_in?
      @customer = Customer.find(current_customer.id)
    else
      @customer = Customer
    end
    @item = Item.find(params[:id])
    @cart_item = CartItem.new
  end
end
