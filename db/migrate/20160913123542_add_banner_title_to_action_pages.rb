class AddBannerTitleToActionPages < ActiveRecord::Migration
  def change
    add_column :action_pages, :banner_title, :string
  end
end
