class BlogSection < ActiveRecord::Base
  belongs_to :blog_page

  mount_uploader :image, BlogSectionUploader

end
