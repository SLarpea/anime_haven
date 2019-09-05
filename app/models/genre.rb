class Genre < ApplicationRecord
  has_many :animes, dependent: :destroy
  has_many :animes, through: :anime_genres, dependent: :destroy
  validates :genre_name, presence: true
  validates :content, presence: true
end
