class Snack < ApplicationRecord
  belongs_to :category
  belongs_to :user
  has_and_belongs_to_many :trails
  has_many :snack_images
  has_many :snack_ratings

  validates :name, presence: true, uniqueness: { scope: :shop_location }
  validates :description, presence: true, length: { minimum: 20 }
  validates :shop_location, presence: true
  validates :category, presence: true
end
