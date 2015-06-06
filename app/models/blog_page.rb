class BlogPage < ActiveRecord::Base
  extend FriendlyId
  friendly_id :title, use: [:slugged, :finders]

  TEMPLATES = [:blog_template_auto_afbetaling]
  belongs_to :templateable, polymorphic: true, dependent: :destroy
  accepts_nested_attributes_for :templateable

  def templateable_attributes=(attributes)
    if TEMPLATES.include?(templateable_type.underscore.to_sym)
      self.templateable ||= self.templateable_type.constantize.new
      self.templateable.assign_attributes(attributes)
    end
  end

end
