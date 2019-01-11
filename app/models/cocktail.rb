class Cocktail < ApplicationRecord
  has_many :doses, dependent: :destroy
  has_many :ingredients, through: :doses, dependent: :destroy
  has_many :reviews, dependent: :destroy
  validates :name, uniqueness: true, presence: true
  mount_uploader :photo, PhotoUploader

  def blank_stars
    5 - average_rating.to_i
  end

end
