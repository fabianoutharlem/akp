class AddNewsletterSubscribeToCqrRequestBusiness < ActiveRecord::Migration
  def change
    add_column :car_request_businesses, :newsletter_subscribe, :boolean
  end
end
