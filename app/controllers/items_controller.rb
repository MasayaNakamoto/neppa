class ItemsController < ApplicationController
  before_action :authenticate_customer!,except: [:index]
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

  private

  def item_params
    params.require(:item).permit(:name, :introduction, :image, :is_active, :price, :image_id, :genre_id)
  end
end
