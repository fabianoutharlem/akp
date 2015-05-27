class AddColToCarMedia < ActiveRecord::Migration
  def change
    add_column :car_media, :avatar_processing, :boolean, null: false, default: false
  end
end
