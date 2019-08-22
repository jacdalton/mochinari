class Snack < ApplicationRecord
  acts_as_favoritable
  geocoded_by :shop_location
  belongs_to :category
  belongs_to :user
  has_and_belongs_to_many :trails
  has_many :snack_images
  has_many :snack_ratings

  validates :name, presence: true, uniqueness: { scope: :shop_location }
  validates :description, presence: true, length: { minimum: 20 }
  validates :shop_location, presence: true
  validates :category, presence: true

  def avg_snack_stars
    return 0 if snack_ratings.empty?
    snack_stars_array = snack_ratings.map(&:stars)
    avg_stars_float = snack_stars_array.inject { |sum, el| sum + el }.to_f / snack_stars_array.size
    avg_stars_float.round(half: :up)
  end
end
