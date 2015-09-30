class AddIndexToPriceFieldOnCars < ActiveRecord::Migration
  def change
    add_index :cars, :price_total
    add_index :cars, :price_month
    add_index :cars, :price_50_50
  end
end
