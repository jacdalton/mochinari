class Category < ApplicationRecord
  has_many :snacks
  has_many :snack_images, through: :snacks

  validates :name, presence: true, length: { maximum: 20 }, uniqueness: true
  validates :description, presence: true
  validates :photo_url, presence: true
end
