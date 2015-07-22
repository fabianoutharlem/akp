class AddColsToMenuItem < ActiveRecord::Migration
  def change
    add_column :menu_items, :position, :integer
  end
end
