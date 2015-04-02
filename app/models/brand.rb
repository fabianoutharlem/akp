class Brand < ActiveRecord::Base

  has_many :cars
  has_many :models, dependent: :destroy

  validates_presence_of :name

end
