class ShopsController < ApplicationController
  before_action :authenticate_customer!,except: [:index]

  def index
    @shops = Shop.order(id: :desc).page(params[:page]).reverse_order
    @genres = Genre.all
    # 上のやつはジャンル名表示に困ってて残してる現状
  end

  def show
    @shop = Shop.find(params[:id])
    @genres = Genre.all
    @comment = Comment.new
  end
end
