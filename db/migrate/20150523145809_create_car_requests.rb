class CreateCarRequests < ActiveRecord::Migration
  def change
    create_table :car_requests do |t|
      t.string :type
      t.string :payment
      t.string :name
      t.string :amount
      t.string :phone
      t.string :license_plate
      t.string :email
      t.string :bkr
      t.string :net_income
      t.string :partner_net_income
      t.string :rent
      t.integer :car_id

      t.timestamps
    end
  end
end
