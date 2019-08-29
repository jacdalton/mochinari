require 'rmagick'
class PhotoUploader < CarrierWave::Uploader::Base
  include Cloudinary::CarrierWave

  process eager: true
  process cloudinary_transformation: { effect: :improve }

end
