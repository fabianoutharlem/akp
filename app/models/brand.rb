class Brand < ActiveRecord::Base

  extend FriendlyId

  friendly_id :name, use: [:slugged, :finders]

  has_many :cars
  has_many :models, dependent: :destroy

  validates_presence_of :name
  validates_uniqueness_of :name

  def self.all_for_menu
    distinct.joins(:cars)
  end

end
