class FavoriteAnime < ApplicationRecord

  belongs_to :user
  belongs_to :anime
  paginates_per 5
end
