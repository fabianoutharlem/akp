class ChangeStaticTextColNames < ActiveRecord::Migration
  def change
    rename_column :static_texts, :name, :key
    rename_column :static_texts, :text, :value
  end
end
