class AlterPageTable < ActiveRecord::Migration
  def change
    remove_column :pages, :page_template_id
    add_column :pages, :content, :text, after: :title
  end
end
