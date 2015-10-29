class CarMedia < ActiveRecord::Base

  belongs_to :car

  default_scope { where(avatar_processing: 0)}

  mount_uploader :file, CarMediaUploader

  before_save :update_asset_attributes

  after_save :check_for_car

  def check_for_car
    destroy if (car_id == nil)
  end

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
