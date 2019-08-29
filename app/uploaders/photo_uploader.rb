class PhotoUploader < CarrierWave::Uploader::Base
  include Cloudinary::CarrierWave
  include CarrierWave::MiniMagick
  include CarrierWave::RMagick

 
  process :strip!


  # version :stripped do 
  #   process :strip, if: image?
  # end

  # def strip
  #   manipulate! do |img|
  #     img.strip!
  #     img = yield(img) if block_given?
  #     img
  #   end
  # end

  # private 
  # def image? 
  #   true
  # end

  # process :remove_animation

  # def remove_animation
  #   manipulate! do |img|
  #     if img.mime_type.match /gif/
  #       img.collapse!
  #     end
  #     img.strip!
  #     img
  #   end
  # end
end
