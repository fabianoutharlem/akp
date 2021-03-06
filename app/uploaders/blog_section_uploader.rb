# encoding: utf-8
require 'carrierwave/processing/mime_types'

class BlogSectionUploader < CarrierWave::Uploader::Base

  # Include RMagick or MiniMagick support:
  include CarrierWave::RMagick
  # include CarrierWave::MiniMagick

  include CarrierWave::MimeTypes

  # Choose what kind of storage to use for this uploader:
  storage :file
  # storage :fog

  version :large do
    process resize_to_fit: [600,600]
  end

  # Override the directory where uploaded files will be stored.
  # This is a sensible default for uploaders that are meant to be mounted:
  def store_dir
    "uploads/#{model.class.to_s.underscore}/#{mounted_as}/#{model.id}"
  end

  process :set_content_type


end
