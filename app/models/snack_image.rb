class SnackImage < ApplicationRecord
  belongs_to :snack
  belongs_to :user
  validates :image_path, presence: true
end
