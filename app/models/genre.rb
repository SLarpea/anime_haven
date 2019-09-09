class Genre < ApplicationRecord
  has_many :anime_genres, dependent: :destroy
  has_many :animes, through: :anime_genres, dependent: :destroy
  validates :genre_name, presence: true
  validates :content, presence: true
  paginates_per 6
end
