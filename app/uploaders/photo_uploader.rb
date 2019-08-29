class PhotoUploader < CarrierWave::Uploader::Base
  include Cloudinary::CarrierWave
  include CarrierWave::MiniMagick

  process :rotate_according_to_exif

  def rotate_according_to_exif
    manipulate! do |img|
      image = MiniMagick::Image.open(img)
      image.tap(&:auto_orient)
    end
  end
end
