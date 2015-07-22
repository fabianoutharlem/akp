class AddNewsletterToCarRequest < ActiveRecord::Migration
  def change
    add_column :car_requests, :newsletter_subscribe, :boolean
  end
end
