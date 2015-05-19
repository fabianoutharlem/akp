class BlogPage < ActiveRecord::Base
  has_many :blog_sections

  accepts_nested_attributes_for :blog_sections
end
