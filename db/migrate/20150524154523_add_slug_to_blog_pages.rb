class AddSlugToBlogPages < ActiveRecord::Migration
  def change
    add_column :blog_pages, :slug, :string, after: :title
    add_index :blog_pages, :slug, unique: true
  end
end
