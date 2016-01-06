class MakeHeaderTitleATextField < ActiveRecord::Migration
  def change
    change_column :action_pages, :header_title, :text
  end
end
