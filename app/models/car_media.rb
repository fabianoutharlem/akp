class CarMedia < ActiveRecord::Base

  belongs_to :car

  mount_uploader :file, CarMediaUploader
  process_in_background :file

  before_save :update_asset_attributes

  def file_type
    if @file_type.present?
      @file_type
    else
      update_asset_attributes
      file.content_type
    end
  end

  private

  def update_asset_attributes
    if file.present? && file_changed?
      self.file_type = file.file.content_type
    end
  end


end
