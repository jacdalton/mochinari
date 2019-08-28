class SnackImage < ApplicationRecord
  mount_uploader :image_path, PhotoUploader

  belongs_to :snack
  belongs_to :user
  validates :image_path, presence: true
end
