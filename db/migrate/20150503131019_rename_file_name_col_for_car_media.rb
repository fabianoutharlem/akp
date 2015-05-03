class RenameFileNameColForCarMedia < ActiveRecord::Migration
  def change
    rename_column :car_media, :file_name, :file
  end
end
