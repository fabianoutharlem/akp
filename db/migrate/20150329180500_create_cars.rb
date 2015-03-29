class CreateCars < ActiveRecord::Migration
  def change
    create_table :cars do |t|
      t.integer :model_id
      t.integer :brand_id
      t.integer :transmission_type_id
      t.integer :car_body_type_id
      t.integer :fuel_type_id
      t.integer :mileage
      t.string :color
      t.string :engine_size
      t.string :type
      t.boolean :nap
      t.boolean :rdw
      t.integer :price_total
      t.integer :price_month
      t.integer :price_50_50
      t.integer :manufacture_year
      t.integer :cylinders
      t.integer :engine_power
      t.integer :top_speed
      t.string :interior
      t.string :energy_label
      t.string :road_tax

      t.timestamps
    end
  end
end
