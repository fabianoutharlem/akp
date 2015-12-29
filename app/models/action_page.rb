class ActionPage < ActiveRecord::Base

  extend FriendlyId
  friendly_id :banner_title, use: [:slugged, :finders]

  belongs_to :brand
  belongs_to :model

  attr_accessor :banner_image_cache

  scope :active_actions, -> { where(active: true) }

  before_save :ensure_one_active_record
  before_save :ensure_model_matches_brand

  validates :banner_image, :banner_subtitle, :banner_title, :brand, presence: true

  def ensure_one_active_record
    if self.active?
      ActionPage.all.where.not(id: self.id).update_all(active: false)
    end
  end

  def ensure_model_matches_brand
    if self.brand != self.model.try(:brand)
      self.model = nil
    end
  end

  mount_uploader :banner_image, ActionPageUploader

  def self.active_action
    active_actions.first
  end

  def should_generate_new_friendly_id?
    slug.blank?
  end

  def cars
    if model.present?
      model.cars
    elsif brand.present?
      brand.cars
    else
      Car.none
    end
  end

end
