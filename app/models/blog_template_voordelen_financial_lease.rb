class BlogTemplateVoordelenFinancialLease < ActiveRecord::Base
  has_many :blog_pages, dependent: :destroy, as: :templateable

  mount_uploader :image_right_1, BlogSectionUploader
  mount_uploader :image_left_1, BlogSectionUploader

  def self.permitted_attributes
    column_names.map(&:to_sym) - [:created_at, :updated_at]
  end

  def self.form_fields
    self.permitted_attributes - [:id]
  end
end
