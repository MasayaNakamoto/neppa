class ShopsController < ApplicationController
  def index
    @shops = Shop.order(id: :desc).page(params[:page]).reverse_order
    @genres = Genre.all
    # @genre = Genre.find(params[:genre_id])
    # 上のやつはジャンル名表示に困ってて残してる現状
  end

  def show
    @shop = Shop.find(params[:id])
    @genres = Genre.all
    @comment = Comment.new
  end
end
