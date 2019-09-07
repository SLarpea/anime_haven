class Character < ApplicationRecord
  has_one_attached :avatar
  has_one_attached :image
  belongs_to :anime
  validates :character_name, presence: true, length: {minimum: 3}
  validates :character_description, presence: true, length: { maximum: 500,
                                                             too_long: "%{count} characters is the maximum allowed" }
  validates :appearance, presence: true, length: { maximum: 500,
                                                   too_long: "%{count} characters is the maximum allowed" }
  validates :role, presence: true
  validates :avatar, attached: true, content_type: [:png, :jpg]
  validates :image, attached: true, content_type: [:png, :jpg]
  paginates_per 6
end