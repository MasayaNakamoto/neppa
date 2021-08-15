class OrdersController < ApplicationController
  before_action :authenticate_customer!

  def new
    @customer = Customer.find(current_customer.id)
    @order = Order.new
    @cart_items = current_customer.cart_items
  end

  def confirm
    @order = Order.new
    @cart_items = current_customer.cart_items
    @customer = Customer.find(current_customer.id)
    @order.payment_method = params[:order][:payment_method]
    if params[:order][:address_option] == "0"
      @address = Address.find(params[:order][:id])
      @order.postal_code = @address.postal_code
      @order.address = @address.address
      @order.name = @address.name
    elsif params[:order][:address_option] == "1"
      @order.postal_code = params[:order][:postal_code]
      @order.address = params[:order][:address]
      @order.name = params[:order][:name]
    end
    @order.shipping_cost = 800
  end

  def create
    @order = Order.new(order_params)
    @order.customer_id = current_customer.id
    @order.save
    @cart_items = current_customer.cart_items.all
    @cart_items.each do |cart_item|
      OrderDetail.create(
        item: cart_item.item,
        order: @order,
        amount: cart_item.amount,
        price: cart_item.item.add_tax_price
      )
      current_customer.cart_items.destroy_all
      redirect_to orders_complete_path
    end
  end

  def complete
    @customer = Customer.find(current_customer.id)
  end

  def index
    @orders = current_customer.orders.page(params[:page]).reverse_order.order("id DESC")
    @customer = Customer.find(current_customer.id)
  end

  def show
    @orders = current_customer.orders.page(params[:page]).reverse_order.order("id DESC")
    @order = Order.find(params[:id])
    @customer = Customer.find(current_customer.id)
    @order.shipping_cost = 500
    @order_details = @order.order_details
  end

  private

  def order_params
    params.require(:order).permit(:customer_id, :postal_code, :address, :name, :shipping_cost, :total_price, :payment_method, :status)

  end
end
