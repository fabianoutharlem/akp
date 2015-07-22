class AddColToBlogPages < ActiveRecord::Migration
  def change
    add_column :blog_pages, :templateable_id, :integer
    add_column :blog_pages, :templateable_type, :string
  end
end
