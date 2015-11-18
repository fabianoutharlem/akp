class CarRequest < ActiveRecord::Base
  belongs_to :car

  before_destroy :invalidate_cache

  def invalidate_cache
    expire_fragment("admin_car_request_#{self.id}")
  end

end
