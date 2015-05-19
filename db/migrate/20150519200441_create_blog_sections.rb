class CreateBlogSections < ActiveRecord::Migration
  def change
    create_table :blog_sections do |t|
      t.string :title
      t.text :content
      t.string :image
      t.references :blog_page

      t.timestamps
    end
  end
end
