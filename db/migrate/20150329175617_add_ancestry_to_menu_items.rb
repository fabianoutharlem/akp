class AddAncestryToMenuItems < ActiveRecord::Migration
  def change
    add_column :menu_items, :ancestry, :string, after: :target
    add_index :menu_items, :ancestry
  end
end
