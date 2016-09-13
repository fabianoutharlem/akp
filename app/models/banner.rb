class Banner < ActiveRecord::Base

  mount_uploader :image, BannerImageUploader

  include RankedModel
  ranks :row_order

  validates_presence_of :image, :link

  scope :active, -> { where(active: true) }

  default_scope { order(row_order: :asc) }

end
