class FuelType < ActiveRecord::Base

  has_many :cars

  enum name: {diesel: 'D', benzine: 'B'}

end
