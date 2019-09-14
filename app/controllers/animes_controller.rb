class AnimesController < ApplicationController
  before_action :authenticate_user!
  before_action :admin_only, only: [:new, :create]
  helper CharactersHelper

  def index
    @animes = Anime.includes(:genres).page(params[:page])
  end

  def show
    @anime = Anime.find(params[:id])
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

  def top_favorite_animes
    @top_favorite_animes = Anime.includes(:favorite_animes)
  end

  private

  def anime_params
    params.require(:anime).permit(:title, :information, genre_ids: [])
  end

  def admin_only
    unless current_user.admin?
      flash[:danger] = "Only admin can proceed to that action"
      redirect_to root_path
    end
  end
end