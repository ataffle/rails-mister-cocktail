class Review < ApplicationRecord
  belongs_to :cocktail

  validates :comment, presence: true
  validates :cocktail_id, presence: true
  validates :rating, presence: true

  RATINGS = [1, 2, 3, 4, 5]

  def blank_stars
    5 - rating
  end

end
