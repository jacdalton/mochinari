class SnackImage < ApplicationRecord
  mount_uploader :image_path, PhotoUploader

  belongs_to :snack
  belongs_to :user
  validates :image_path, presence: true

  def strip
    image = MiniMagick::Image.new(self.image_path.url)
    image.strip 
    self.image_path.url = image
    self.save!
  end
end
