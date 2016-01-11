class AdFieldsToActionPage < ActiveRecord::Migration
  def change
    add_column :action_pages, :reference_header, :string
    add_column :action_pages, :reference_subtitle, :string
  end
end
