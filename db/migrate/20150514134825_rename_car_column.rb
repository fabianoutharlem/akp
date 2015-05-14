class RenameCarColumn < ActiveRecord::Migration
  def change
    rename_column :cars, :car_body_type_id, :body_type_id
  end
end
