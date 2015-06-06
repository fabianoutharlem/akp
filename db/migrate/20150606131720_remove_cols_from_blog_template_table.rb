class RemoveColsFromBlogTemplateTable < ActiveRecord::Migration
  def change
    remove_column :blog_template_auto_afbetalings, :templateable_id
    remove_column :blog_template_auto_afbetalings, :templateable_type
  end
end
