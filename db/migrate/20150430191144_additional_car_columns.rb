class AdditionalCarColumns < ActiveRecord::Migration
  def change
    add_column :cars, :license_plate, :string, after: :road_tax
    add_column :cars, :door_count, :string, after: :road_tax
    add_column :cars, :vehicle_number_hexon, :string, after: :id
    add_column :cars, :vehicle_number, :string, after: :id
    add_column :cars, :color_type, :string, after: :color
    add_column :cars, :btw_marge, :string, after: :road_tax
    add_column :cars, :new, :string, after: :road_tax
    add_column :cars, :reserved, :string, after: :road_tax

  end
end
