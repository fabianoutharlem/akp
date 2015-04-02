class Model < ActiveRecord::Base

  has_many :cars
  belongs_to :brand

  validates :name, presence: true
  validates_presence_of :brand
  validates_associated :brand

end
