class CreateActionPages < ActiveRecord::Migration
  def change
    create_table :action_pages do |t|
      t.string :banner_title
      t.string :banner_subtitle
      t.string :banner_image
      t.boolean :active

      t.timestamps
    end
  end
end
