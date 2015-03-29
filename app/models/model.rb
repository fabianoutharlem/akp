class Model < ActiveRecord::Base

  has_many :cars
  belongs_to :brand

end
