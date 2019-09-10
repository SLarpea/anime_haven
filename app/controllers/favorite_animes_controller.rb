class FavoriteAnimesController < ApplicationController
  before_action :need_signed_in, only: [:create,:destroy]
  before_action :current_user_only, only: [:destroy]

  def index
    @favorites = current_user.admin? ? FavoriteAnime.includes(:anime).page(params[:page]) : current_user.favorite_animes.includes(:user, :anime).page(params[:page])
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

  private

  def need_signed_in
    unless user_signed_in?
      flash[:danger] = "You need to signed in first to proceed in adding your favorite anime!"
      redirect_to animes_path
    end
  end

  def current_user_only
    unless current_user.id == @favorite.id
      flash[:danger] = "Only the reader can delete his own favorite anime!"
      redirect_to favorite_animes_path
    end
  end
end