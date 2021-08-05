class Admin::GenresController < ApplicationController
  def index
    @genre = Genre.new
    @genres = Genre.all
    @customer = Customer
  end

  def create
    @genre = Genre.new(genre_params)
    if @genre.save
      redirect_to admin_genres_path
    else
      @genres = Genre.all
      render :index
    end
  end

  def edit
    @genre = Genre.find(params[:id])
    @customer = Customer
  end

  def update
    genre = Genre.find(params[:id])
    genre.update(genre_params)
    redirect_to admin_genres_path
  end
end