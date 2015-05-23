class RenameTypeColumn < ActiveRecord::Migration
  def change
    rename_column :car_requests, :type, :request_type
  end
end
