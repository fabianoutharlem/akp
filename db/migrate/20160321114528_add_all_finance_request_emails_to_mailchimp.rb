class AddAllFinanceRequestEmailsToMailchimp < ActiveRecord::Migration
  def change
    CarRequest.where(newsletter_subscribe: 1).each do |car_request|
      car_request.subscribe_to_newsletter
    end

    CarRequestBusiness.where(newsletter_subscribe: 1).each do |car_request|
      car_request.subscribe_to_newsletter
    end
  end
end
