class FavoriteAnimesController < ApplicationController

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
end
