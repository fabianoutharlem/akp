class AddWoonachtigToCarRequests < ActiveRecord::Migration
  def change
    add_column :car_requests, :woonachtig, :string
  end
end
