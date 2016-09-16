class ActionPage < ActiveRecord::Base

  extend FriendlyId
  friendly_id :banner_title, use: [:slugged, :finders]

  belongs_to :brand
  belongs_to :model

  attr_accessor :banner_image_cache
  attr_accessor :orange_banner_image_cache
  attr_accessor :reference_image_cache
  attr_accessor :reference_car_image_cache

  scope :active_actions, -> { where(active: true) }

  before_save :ensure_one_active_record
  before_save :ensure_model_matches_brand

  validates :banner_image, :banner_title, :header_title, :header_text, :car_section_title, :car_section_subtitle, presence: true
  validates_presence_of :orange_banner_image, :orange_banner_title, :orange_banner_text, if: lambda { orange_banner_enabled? }
  validates_presence_of :reference_image, :reference_text, :reference_stars, :reference_car_image, if: lambda { reference_banner_enabled? }

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
  mount_uploader :orange_banner_image, ActionPageUploader
  mount_uploader :reference_image, ActionPageUploader
  mount_uploader :reference_car_image, ActionPageUploader


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
      Car.all
    end
  end

end
