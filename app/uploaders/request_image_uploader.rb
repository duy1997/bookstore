class RequestImageUploader < CarrierWave::Uploader::Base
  include CarrierWave::RMagick
  process resize_to_fill: [600, 900]
  storage :file

  def extension_whitelist
    %w[jpg jpeg gif png]
  end

  def store_dir
    "uploads/#{model.class.to_s.underscore}/#{mounted_as}/#{model.id}"
  end

  def default_url
    ActionController::Base.helpers.image_path('BookLogo.jpg')
  end

  version :thumb do
    process resize_to_fill: [186, 279]
  end
end