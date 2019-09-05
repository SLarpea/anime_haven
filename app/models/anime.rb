class Anime < ApplicationRecord
  has_one_attached :image
  has_many :anime_genres, dependent: :destroy
  has_many :genres, through: :anime_genres, dependent: :destroy
  validates :title, presence: true
  validates :information, presence: true
  validates :image, attached: true, content_type: [:png, :jpg],
            size: {less_than: 300.megabytes, message: "is not a given size"}
end
