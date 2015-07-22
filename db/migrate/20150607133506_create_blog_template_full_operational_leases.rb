class CreateBlogTemplateFullOperationalLeases < ActiveRecord::Migration
  def change
    create_table :blog_template_full_operational_leases do |t|
      t.text :blue_block_left_1
      t.string :image_right_1
      t.string :image_left_1
      t.text :white_block_right_1

      t.timestamps
    end
  end
end
