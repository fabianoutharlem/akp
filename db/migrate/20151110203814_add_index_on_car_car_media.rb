class AddIndexOnCarCarMedia < ActiveRecord::Migration
  def change
    add_index :car_media, :car_id
  end
end
