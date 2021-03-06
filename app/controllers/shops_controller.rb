class ShopsController < ApplicationController
  before_action :authenticate_customer!,except: [:index]

  def index
    @shops = Shop.order(id: :desc).page(params[:page]).reverse_order
    @genres = Genre.all
    p "///////"
    if params[:genre].present?
    @shops = Shop.where(genre_id: params[:genre])
    end
  # memo:presentメソッドはオブジェクトであるレシーバーの値が存在すればtrue、存在しなければfalseを返すメソッド
  end

  def show
    @shop = Shop.find(params[:id])
    @genres = Genre.all
    @comment = Comment.new
    @comments = Comment.page(params[:page]).reverse_order.order("id DESC")
  end

  def search
  @shops = Shop.search(params[:keyword])
  @keyword = params[:keyword]
  @genres = Genre.all
  render "index"
  end
end
