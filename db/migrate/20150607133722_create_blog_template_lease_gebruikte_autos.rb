class CreateBlogTemplateLeaseGebruikteAutos < ActiveRecord::Migration
  def change
    create_table :blog_template_lease_gebruikte_autos do |t|
      t.text :blue_block_left_1
      t.string :image_right_1
      t.text :white_block_right_1
      t.text :white_block_left_1
      t.string :image_right_2
      t.text :blue_block_left_2

      t.timestamps
    end
  end
end
