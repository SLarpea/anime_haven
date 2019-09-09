class User < ApplicationRecord
  devise :database_authenticatable, :registerable,
         :recoverable, :rememberable, :validatable
  has_many :favorite_animes, dependent: :destroy
  has_many :animes, through: :favorite_animes
end
