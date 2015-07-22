class RemoveAncestryFromMenuItems < ActiveRecord::Migration
  def change
    remove_column :menu_items, :menu_id
    remove_column :menu_items, :target
    remove_column :menu_items, :ancestry
    rename_column :menu_items, :action, :path
    drop_table :menus
  end
end
