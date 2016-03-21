class CarRequest < ActiveRecord::Base
  include MailchimpSubscriber

  belongs_to :car

  before_destroy :invalidate_cache

  def invalidate_cache
    ActionController::Base.new.expire_fragment("admin_car_request_#{self.id}")
  end

end
