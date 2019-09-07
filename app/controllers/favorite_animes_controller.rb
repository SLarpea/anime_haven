class FavoriteAnimesController < ApplicationController

  def create
    @anime = Anime.find(params[:anime_id])
    @favorite_anime = current_user.favorite_animes.build(params.require(:favorite_anime).permit(:anime_id))
    if @favorite_anime.save
      flash[:success] = "You have added #{favorite_animes.anime.title} into your Favorites!"
      redirect_to animes_path
    else
      redirect_to animes_path
    end
  end
end
