class AddCarIndexToMultipleModels < ActiveRecord::Migration
  def change
    add_index :cars, :brand_id
    add_index :cars, :model_id
    add_index :cars, :transmission_type_id

  end
end
