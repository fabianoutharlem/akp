class AddColumnsToActionPage < ActiveRecord::Migration
  def change
    add_column :action_pages, :header_title, :string
    add_column :action_pages, :header_text, :text
    add_column :action_pages, :car_section_title, :string
    add_column :action_pages, :car_section_subtitle, :text
    add_column :action_pages, :orange_banner_enabled, :boolean
    add_column :action_pages, :orange_banner_image, :string
    add_column :action_pages, :orange_banner_title, :string
    add_column :action_pages, :orange_banner_text, :text
    add_column :action_pages, :pros_list_enabled, :boolean
    add_column :action_pages, :reference_banner_enabled, :boolean
    add_column :action_pages, :reference_image, :string
    add_column :action_pages, :reference_stars, :integer
    add_column :action_pages, :reference_text, :text
    add_column :action_pages, :reference_car_image, :string
  end
end
