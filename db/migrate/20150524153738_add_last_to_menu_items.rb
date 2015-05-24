class AddLastToMenuItems < ActiveRecord::Migration
  def change
    add_column :menu_items, :last, :boolean, after: :path
  end
end
