class CreateBlogTemplateAutoAfbetalings < ActiveRecord::Migration
  def change
    create_table :blog_template_auto_afbetalings do |t|
      t.text :blue_block_left_1
      t.text :white_block_left_1
      t.text :blue_block_left_2
      t.string :image_right_1
      t.text :white_block_right_1
      t.string :image_right_2
      t.text :blue_block_right_1
      t.references :templateable, polymorphic: true

      t.timestamps
    end
  end
end
