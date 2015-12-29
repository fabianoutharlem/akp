class AddSlugToActionPages < ActiveRecord::Migration
  def change
    add_column :action_pages, :slug, :string
  end
end
