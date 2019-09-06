class CharactersController < ApplicationController

  def new
    @anime = Anime.find(params[:anime_id])
    @character = @anime.characters.new
  end

  def create
    @anime = Anime.find(params[:anime_id])
    @character = @anime.characters.build(character_params)
    @character.avatar.attach(params[:character][:avatar])
    @character.image.attach(params[:character][:image])
    if @character.save
      flash[:success] = "You have successfully inserted a new character"
      redirect_to anime_path(@anime)
    else
      render :new
    end
  end

  private

  def character_params
    params.require(:character).permit(:character_name,:character_description,:appearance,:role)
  end

end