class CartItemsController < ApplicationController
  before_action :authenticate_customer!

  def index
    @customer = Customer.find(current_customer.id)
    @cart_item = CartItem.where(customer_id: current_customer.id)
  end

  def create
    @cart_item = CartItem.new(cart_item_params)
    @cart_item.customer_id = current_customer.id
    if @cart_item.save
      redirect_to cart_items_path
    else
      redirect_to items_path
    end
  end

  def update
    @cart_item = CartItem.find(params[:id])
    @cart_item.update(cart_item_params)
    redirect_to cart_items_path
  end

  def destroy
  end

  def destroy_all
  end

  private

  def cart_item_params
    params.require(:cart_item).permit(:item_id, :amount, :customer_id)
  end


end
