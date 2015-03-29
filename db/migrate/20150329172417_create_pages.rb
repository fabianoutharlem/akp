class CreatePages < ActiveRecord::Migration
  def change
    create_table :pages do |t|
      t.integer :page_template_id
      t.string :title
      t.string :slug

      t.timestamps
    end
  end
end
