class CreateCarRequestBusinesses < ActiveRecord::Migration
  def change
    create_table :car_request_businesses do |t|
      t.string :request_type
      t.references :car, index: true
      t.string :email
      t.string :phone
      t.string :kvk
      t.string :date_creation
      t.string :first_name
      t.string :last_name
      t.string :notes
      t.string :payment
      t.string :amount

      t.timestamps
    end
  end
end
