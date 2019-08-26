class SnackImage < ApplicationRecord
  mount_uploader :image_path, PhotoUploader

  belongs_to :snack
  belongs_to :user
  validates :snack, presence: true
  validates :image_path, presence: true
  validates :user, presence: true
end
