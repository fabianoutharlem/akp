class CreateContactRequests < ActiveRecord::Migration
  def change
    create_table :contact_requests do |t|
      t.string :phone_number

      t.timestamps
    end
  end
end
