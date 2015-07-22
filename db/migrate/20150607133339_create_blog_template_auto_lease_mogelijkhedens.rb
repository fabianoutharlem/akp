class CreateBlogTemplateAutoLeaseMogelijkhedens < ActiveRecord::Migration
  def change
    create_table :blog_template_auto_lease_mogelijkhedens do |t|
      t.text :blue_block_left_1
      t.string :image_right_1
      t.text :white_block_right_1
      t.string :image_left_1

      t.timestamps
    end
  end
end
