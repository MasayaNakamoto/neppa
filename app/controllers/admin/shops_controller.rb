class Admin::ShopsController < ApplicationController
  def new
    @customer = Customer
    @shop = Shop.new
  end

 def create
    @shop = Shop.new(shop_params)
    if @shop.save
      redirect_to admin_shops_path
      flash[:success] = "店舗登録完了"
    else
      render :new
    end
 end

 def index
    @customer = Customer
    @shops = Shop.order(id: :desc).page(params[:page]).reverse_order
 end

 def show
    @customer = Customer
    @shop = Shop.find(params[:id])
 end

 def edit
    @customer = Customer
    @shop = Shop.find(params[:id])
 end

 def update
    shop = Shop.find(params[:id])
    shop.update(shop_params)
    redirect_to admin_shop_path(item)
 end

 private

  def shop_params
    params.require(:shop).permit(:name, :introduction, :image, :postal_code, :address, :phone_number, :homepage, :price, :sauna, :image_id, :genre_id)
  end

end
