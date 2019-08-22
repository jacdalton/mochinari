class SnackImage < ApplicationRecord
  belongs_to :snack
  belongs_to :user
  validates :snack, presence: true
  validates :image_path, presence: true
  validates :user, presence: true
end
