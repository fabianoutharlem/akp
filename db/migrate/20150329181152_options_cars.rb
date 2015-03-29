class OptionsCars < ActiveRecord::Migration
  def change
    create_table :cars_options, id: false do |t|
      t.references :car, null: false
      t.references :option, null: false
    end
    add_index :cars_options, [:car_id, :option_id], unique: true
  end
end
