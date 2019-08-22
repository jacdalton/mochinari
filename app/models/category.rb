class Category < ApplicationRecord
  acts_as_taggable_on :tags

  has_many :snacks
  has_many :snack_images, through: :snacks

  validates :name, presence: true, length: { maximum: 20 }, uniqueness: true
  validates :description, presence: true
  validates :image_path, presence: true
end
