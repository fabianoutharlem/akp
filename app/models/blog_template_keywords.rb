class BlogTemplateKeywords < ActiveRecord::Base

  has_many :blog_pages, as: :templateable

  def self.permitted_attributes
    column_names.map(&:to_sym) - [:created_at, :updated_at]
  end

  def self.form_fields
    self.permitted_attributes - [:id]
  end

end
