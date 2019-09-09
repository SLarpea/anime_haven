class User < ApplicationRecord
  devise :database_authenticatable, :registerable,
         :recoverable, :rememberable, :validatable
  has_many :favorite_animes, dependent: :destroy
  has_many :animes, through: :favorite_animes
  after_initialize :set_default_role, if: :new_record?

  def admin?
    self.role == "admin"
  end

  def reader?
    self.role == "reader"
  end

  private

    def set_default_role
      self.role ||= :reader
    end
end
