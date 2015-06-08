class CreateBlogTemplateAutoBlogs < ActiveRecord::Migration
  def change
    create_table :blog_template_auto_blogs do |t|
      t.text :white_left_block_1
      t.string :youtube_embed_url
      t.string :image_left_1
      t.text :white_block_right_1
      t.string :image_left_2
      t.text :blue_block_right_1
      t.text :orange_block
      t.text :white_block_left_2
      t.string :image_right_1
      t.string :image_left_3
      t.text :blue_block_right_2

      t.timestamps
    end
  end
end
