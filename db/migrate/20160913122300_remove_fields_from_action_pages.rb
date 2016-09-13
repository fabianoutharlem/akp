class RemoveFieldsFromActionPages < ActiveRecord::Migration
  def change
    remove_columns :action_pages, :banner_title, :banner_subtitle
  end
end
