class Character < ApplicationRecord
  has_one_attached :avatar
  has_one_attached :image
  belongs_to :anime
end
