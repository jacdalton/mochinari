#config/initializers/carrierwave.rb
module CarrierWave
  module MiniMagick
		# Rotates the image based on the EXIF Orientation
    def exif_rotation
      manipulate! do |img|
        img.auto_orient
        img = yield(img) if block_given?
        img
      end
    end
 
    # Strips out all embedded information from the image
    def strip
      manipulate! do |img|
        img.strip!
        img = yield(img) if block_given?
        img
      end
    end
  

  end
end