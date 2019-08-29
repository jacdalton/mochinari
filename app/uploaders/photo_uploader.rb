class PhotoUploader < CarrierWave::Uploader::Base
  include Cloudinary::CarrierWave
  include CarrierWave::MiniMagick

  process :auto_orient

  def auto_orient 
    manipulate! do |img| 
      img.auto_orient!
    end 
  end
end
