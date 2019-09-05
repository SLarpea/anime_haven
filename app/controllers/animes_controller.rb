class AnimesController < ApplicationController

  def index
    @animes = Anime.includes(:genres)
  end
  def new
    @anime = Anime.new
  end

  def create
    @anime = Anime.new(anime_params)
    @anime.image.attach(params[:anime][:image])
    if @anime.save
      flash[:success] = "Success! You have successfully created a new anime"
      redirect_to root_path
    else
      render :new
    end
  end

  private

  def anime_params
    params.require(:anime).permit(:title, :information, genre_ids: [])
  end
end
