class CreateMenuItems < ActiveRecord::Migration
  def change
    create_table :menu_items do |t|
      t.integer :menu_id
      t.string :label
      t.string :action
      t.integer :target

      t.timestamps
    end
  end
end
