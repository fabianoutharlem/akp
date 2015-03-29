class CarMedia < ActiveRecord::Base

  belongs_to :car

  mount_uploader :file_name, CarMediaUploader

end
