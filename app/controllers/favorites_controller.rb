class FavoritesController < ApplicationController
  def create
    @shop = Shop.find(params[:shop_id])
    favorite = current_customer.favorites.new(shop_id: @shop.id)
    favorite.save
  end

  def destroy
    @shop = Shop.find(params[:shop_id])
    favorite = current_customer.favorites.find_by(shop_id: @shop.id)
    favorite.destroy
  end
end
