class Anime < ApplicationRecord
  has_one_attached :image
  has_many :anime_genres, dependent: :destroy
  has_many :genres, through: :anime_genres, dependent: :destroy
  has_many :characters, dependent: :destroy
  validates :title, presence: true, length: {minimum: 5}
  validates :information, presence: true, length: { maximum: 200,
                                                    too_long: "%{count} characters is the maximum allowed" }
  validates :image, attached: true, content_type: [:png, :jpg],
            size: {less_than: 300.megabytes, message: "is not a given size"}
  paginates_per 6
end