class AddressesController < ApplicationController
  def index
    @addresses = Address.where(id: current_customer.addresses)
    @address = Address.new
    @customer = Customer.find(current_customer.id)
  end

  def create
    @address = Address.new(address_params)
    @address.customer_id = current_customer.id
    if @address.save
      redirect_to addresses_path(@address),notice: "You have created receiver's address successfully."
    else
       @addresses = Address.all
       @customer = Customer.find(current_customer.id)
       render 'index'
    end
  end

  def edit
  end

  def update
  end

  def destroy
  end

   private
  def address_params
    params.require(:address).permit(:post_code, :address, :name)
  end


end
