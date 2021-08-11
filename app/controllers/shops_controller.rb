class ShopsController < ApplicationController
  def index
    @shops = Shop.order(id: :desc).page(params[:page]).reverse_order
    @genres = Genre.all
  end

  def show
    @shop = Shop.find(params[:id])
    @genres = Genre.all
    @comment = Comment.new
  end
end
