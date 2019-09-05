class GenresController < ApplicationController

  def new
    @genre = Genre.new
  end

  def create
    @genre = Genre.new(genre_params)
    if @genre.save
      flash[:success] = "Success! You have created a new genre"
      redirect_to root_path
    else
      render :new
    end
  end

  private

  def genre_params
    params.require(:genre).permit(:genre_name, :content)
  end
end
