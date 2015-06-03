class CreateCmsFields < ActiveRecord::Migration
  def change
    create_table :cms_fields do |t|
      t.string :home_foto_1
      t.string :home_foto_2
      t.string :home_foto_3
      t.string :service_bg

      t.timestamps
    end
  end
end
