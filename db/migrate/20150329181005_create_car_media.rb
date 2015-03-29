class CreateCarMedia < ActiveRecord::Migration
  def change
    create_table :car_media do |t|
      t.integer :car_id
      t.string :file_name
      t.string :file_type

      t.timestamps
    end
  end
end
