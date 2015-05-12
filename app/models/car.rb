class Car < ActiveRecord::Base
  include Elasticsearch::Model
  include Elasticsearch::Model::Callbacks

  belongs_to :body_type
  belongs_to :fuel_type
  belongs_to :model
  belongs_to :brand
  belongs_to :transmission_type
  has_and_belongs_to_many :options
  has_many :car_medias, dependent: :destroy

  enum nap: {true: 'j', false: 'n'}
  enum reserved: {'Gereserveerd' => 'j', 'Niet Gereserveerd' => 'n'}
  enum new: {'Nieuw' => 'j', 'Occasion' => 'n'}
  enum btw_marge: {'BTW' => 'B', 'Marge' => 'M'}

  accepts_nested_attributes_for :options

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
    fields = [brand.name, model.name]
    fields << car_type unless car_type.blank?
    fields.join(' ')
  end

  def as_indexed_json(options={})
    as_json(
        only: [:id, :display_name, :mileage, :color, :engine_size, :type, :nap, :rdw, :price_total, :price_50_50, :price_month, :manufacture_year, :cylinders, :engine_power, :top_speed, :interior, :energy_label, :road_tax],
        include: [:model, :brand, :body_type, :fuel_type, :transmission_type, :options],
        methods: [:display_name]
    )
  end

  def self.parse_cardesk_parameters(params)
    brand = Brand.find_or_create_by(name: params[:merk])
    model = Model.find_or_create_by(name: params[:model], brand: brand)
    body = BodyType.find_or_create_by(name: params[:carrosserie])
    fuel = FuelType.find_or_create_by(name: params[:brandstof])
    transmission = TransmissionType.find_or_create_by(name: params[:transmissie])

    options = params[:accessoires].split(',').map do |option|
      Option.find_or_create_by(name: option)
    end

    media = params[:afbeeldingen].split(',').map do |image_url|
      carmedia = CarMedia.new
      carmedia.remote_file_url = image_url
      carmedia.save!
      carmedia
    end

    {
        vehicle_number: params[:voertuignr],
        vehicle_number_hexon: params[:voertuignr_hexon],
        brand_id: brand.id,
        model_id: model.id,
        transmission_type_id: transmission.id,
        car_body_type_id: body.id,
        fuel_type_id: fuel.id,
        mileage: params[:tellerstand],
        color: params[:basiskleur],
        color_type: params[:laksoort],
        engine_size: params[:cilinderinhoud],
        car_type: params[:type],
        nap: params[:nap_weblabel],
        price_total: params[:verkoopprijs_particulier],
        price_month: params[:lease_maandbedrag],
        price_50_50: params[:verkoopprijs_handel_bpm],
        manufacture_year: params[:bouwjaar],
        cylinders: params[:aantal_cilinders],
        engine_power: params[:vermogen_motor_pk],
        top_speed: params[:topsnelheid],
        energy_label: params[:energielabel],
        road_tax: "#{params[:wegenbelasting_kwartaal_min]} / #{params[:wegenbelasting_kwartaal_max]}",
        reserved: params[:gereserveerd],
        new: params[:nieuw],
        btw_marge: params[:btw_marge],
        door_count: params[:aantal_deuren],
        license_plate: params[:kenteken],
        options: options,
        car_medias: media
    }
  end

end
