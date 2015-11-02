class RemoveSomeFieldsFromKeywords < ActiveRecord::Migration
  def change
    remove_column :blog_template_keywords, :titel
    remove_column :blog_template_keywords, :content_1
  end
end
