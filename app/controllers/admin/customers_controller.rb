class Admin::CustomersController < ApplicationController
def index
 @customers = Customer.all
end

def show
 @customer = Customer.find(params[:id])
end

def edit
 @customer = Customer.find(params[:id])
end

def update
 @customer = Customer.find(params[:id])
  if @customer.update(customer_params)
     flash[:success] = "変更完了"
  	 redirect_to admin_customer_path
  else
  	 render "index"
  end
end
end
