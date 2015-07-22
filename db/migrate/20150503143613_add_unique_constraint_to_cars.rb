class AddUniqueConstraintToCars < ActiveRecord::Migration
  def change
    add_index :cars, [:vehicle_number, :vehicle_number_hexon], unique: true
  end
end
