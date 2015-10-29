class AddWoonachtigToCarRequestsBussiness < ActiveRecord::Migration
  def change
    add_column :car_request_businesses, :woonachtig, :string
  end
end
