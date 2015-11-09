class CreateBlogTemplateKeywords < ActiveRecord::Migration
  def change
    create_table :blog_template_keywords do |t|
      t.string :titel
      t.text :content_1
      t.string :nieuw_binnen_titel
      t.text :nieuw_binnen_content
      t.string :blocks_titel
      t.text :blocks_heading

      t.timestamps
    end
  end
end
