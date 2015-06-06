class BlogTemplateAutoAfbetaling < ActiveRecord::Base
  has_many :blog_pages, dependent: :destroy, as: :templateable

  mount_uploader :image_right_1, BlogSectionUploader
  mount_uploader :image_right_2, BlogSectionUploader

  def self.permitted_attributes
    column_names.map(&:to_sym) - [:created_at, :updated_at]
  end

end
