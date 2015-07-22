class CreateBlogTemplateOnzeWerkplaats < ActiveRecord::Migration
  def change
    create_table :blog_template_onze_werkplaats do |t|
      t.string :top_image
      t.text :top_white_block
      t.string :image_left
      t.text :blue_block_right

      t.timestamps
    end
  end
end
