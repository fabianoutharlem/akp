class CreateBlogPages < ActiveRecord::Migration
  def change
    create_table :blog_pages do |t|
      t.string :title
      t.text :content

      t.timestamps
    end
  end
end
