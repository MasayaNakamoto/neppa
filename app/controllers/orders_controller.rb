class OrdersController < ApplicationController
  def new
    @customer = Customer.find(current_customer.id)
    @order = Order.new
  end

  def confirm
  end

  def create
  end

  def complete
  end

  def index
  end

  def show
  end

  private

  def order_params
    params.require(:order).permit(:customer_id, :postal_code, :address, :name, :shipping_cost, :total_price, :payment_method, :status)

  end

  def cart_item_params
    params.require(:cart_item).permit(:item_id, :amount, :customer_id)
  end

  def address_params
    params.require(:address).permit(:postal_code, :address, :name)

  end
end
