class DeleteBlogSections < ActiveRecord::Migration
  def change
    drop_table :blog_sections
  end
end
