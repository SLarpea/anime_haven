class FavoriteAnimesController < ApplicationController

  def index
    @favorites = current_user.favorite_animes.includes(:user, :anime).page(params[:page])
  end

  def create
    @favorite = current_user.favorite_animes.build(anime_id: params[:anime_id])
    if @favorite.save
      flash[:success] = " #{@favorite.anime.title} is added to your favorites!"
      redirect_to animes_path
    else
      flash[:danger] = "Unable to add favorite anime."
      redirect_to animes_path
    end
  end

  def destroy
    @favorite = current_user.favorite_animes.find(params[:id])
    if @favorite.destroy
      flash[:success] = "#{@favorite.anime.title} is removed to your favorites!"
      redirect_to favorite_animes_path
    end
  end
end
