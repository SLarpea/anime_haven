module CharactersHelper

  def main_character(characters)
    characters.where(role: "Main Character")
  end

  def side_character(characters)
    characters.where(role: "Side Character")
  end
end
