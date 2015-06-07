class CreateBlogTemplateOpelEyeTrackings < ActiveRecord::Migration
  def change
    create_table :blog_template_opel_eye_trackings do |t|
      t.string :top_image
      t.text :blue_block
      t.text :orange_block

      t.timestamps
    end
  end
end
