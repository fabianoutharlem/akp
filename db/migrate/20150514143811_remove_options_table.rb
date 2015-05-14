class RemoveOptionsTable < ActiveRecord::Migration
  def change
    drop_table :cars_options
    drop_table :options
  end
end
