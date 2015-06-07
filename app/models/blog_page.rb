class BlogPage < ActiveRecord::Base
  extend FriendlyId
  friendly_id :title, use: [:slugged, :finders]

  TEMPLATES = [:blog_template_auto_afbetaling, :blog_template_auto_lease_mogelijkheden, :blog_template_full_operational_lease, :blog_template_lease_gebruikte_autos, :blog_template_onze_werkplaats, :blog_template_opel_eye_tracking, :blog_template_voordelen_financial_lease]
  belongs_to :templateable, polymorphic: true, dependent: :destroy
  accepts_nested_attributes_for :templateable

  def templateable_attributes=(attributes)
    if TEMPLATES.include?(templateable_type.underscore.to_sym)
      self.templateable ||= self.templateable_type.constantize.new
      self.templateable.assign_attributes(attributes)
    end
  end

end
