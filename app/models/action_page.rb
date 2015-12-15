class ActionPage < ActiveRecord::Base

  belongs_to :brand
  belongs_to :model

  attr_accessor :banner_image_cache

  scope :active_actions, -> { where(active: true) }

  before_save :ensure_one_active_record

  validates :banner_image, :banner_subtitle, :banner_title, :brand, presence: true

  def ensure_one_active_record
    if self.active?
      ActionPage.all.except(self).update_all(active: false)
    end
  end

  mount_uploader :banner_image, ActionPageUploader

  def self.active_action
    active_actions.first
  end

end
