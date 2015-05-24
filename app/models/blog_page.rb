class BlogPage < ActiveRecord::Base
  has_many :blog_sections, dependent: :destroy

  accepts_nested_attributes_for :blog_sections, :reject_if => :all_blank, :allow_destroy => true

  extend FriendlyId
  friendly_id :title, use: [:slugged, :finders]
end
