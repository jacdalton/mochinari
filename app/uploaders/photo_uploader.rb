class PhotoUploader < CarrierWave::Uploader::Base
  include Cloudinary::CarrierWave
  include CarrierWave::MiniMagick

  process :fix_exif_rotation

  def fix_exif_rotation 
    manipulate! do |img|
      img.tap(&:auto_orient!)
      img
    end
  end
end
