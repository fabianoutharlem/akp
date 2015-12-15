# encoding: utf-8

class ActionPageUploader < CarrierWave::Uploader::Base

  include CarrierWave::RMagick

  # Choose what kind of storage to use for this uploader:
  storage :file
  # storage :fog

  def store_dir
    "uploads/#{model.class.to_s.underscore}/#{mounted_as}/#{model.id}"
  end

  def extension_white_list
    %w(jpg jpeg png)
  end

  version :admin do
    process resize_to_fit: [800, 400]
  end

  version :large do
    process resize_to_fill: [1360, 780]
  end


end
