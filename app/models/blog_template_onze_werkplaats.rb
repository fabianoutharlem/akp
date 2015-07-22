class BlogTemplateOnzeWerkplaats < ActiveRecord::Base
  has_many :blog_pages, as: :templateable

  mount_uploader :top_image, BlogSectionUploader
  mount_uploader :image_left, BlogSectionUploader

  def self.permitted_attributes
    column_names.map(&:to_sym) - [:created_at, :updated_at]
  end

  def self.form_fields
    self.permitted_attributes - [:id]
  end
end
