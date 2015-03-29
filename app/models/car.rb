class Car < ActiveRecord::Base

  belongs_to :body_type
  belongs_to :fuel_type
  belongs_to :model
  belongs_to :brand
  belongs_to :transmission_type

  has_and_belongs_to_many :options

  has_many :car_medias

end
