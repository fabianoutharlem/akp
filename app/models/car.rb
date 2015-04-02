class Car < ActiveRecord::Base
  include Elasticsearch::Model
  include Elasticsearch::Model::Callbacks

  belongs_to :body_type
  belongs_to :fuel_type
  belongs_to :model
  belongs_to :brand
  belongs_to :transmission_type
  has_and_belongs_to_many :options
  has_many :car_medias

  validates_associated :model, :brand
  validates :mileage, :color, :engine_size, :manufacture_year, :energy_label, :road_tax, presence: true

  def self.query(query={})
    results = Car.search(query)
    if results.results.total
      results.records.to_a
    else
      nil
    end
  end

  def display_name
    [brand.name, model.name].join(' ')
  end

  def as_indexed_json(options={})
    as_json(
        only: [:id, :display_name, :mileage, :color, :engine_size, :type, :nap, :rdw, :price_total, :price_50_50, :price_month, :manufacture_year, :cylinders, :engine_power, :top_speed, :interior, :energy_label, :road_tax],
        include: [:model, :brand, :body_type, :fuel_type, :transmission_type, :options],
        methods: [:display_name]
    )
  end

end
