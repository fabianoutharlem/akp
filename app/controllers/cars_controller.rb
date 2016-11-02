class CarsController < ApplicationController

  add_breadcrumb 'Autos', :voorraad_cars_path

  def home
    @cars = Car.all.limit(4).order(created_at: :desc)
    references = Reference.where(approved: true)
    @references = references.limit(2)
    @reference_avarage = Reference.avarage(references)
    @cms_fields = CmsField.first
  end

  def show
    begin
      @car = Car.car_includes.find(params[:id])
      track_event 'cars', 'Auto detail bekeken', @car.display_name, @car.vehicle_number
      add_breadcrumb @car.display_name
    rescue Exception => e
      Rails.logger.info e.message
      redirect_to root_path unless @car.present?
    end
  end

  def brand
    @brand = Brand.find(params[:brand_id])
    @cars = @brand.cars.includes(:brand, :model).order(order_hash).page(params[:page]).per(16)
    add_breadcrumb @brand.name
  end

  def model
    @model = Model.find(params[:model_id])
    @cars = @model.cars.includes(:brand, :model).order(order_hash).page(params[:page]).per(16)
    add_breadcrumb @model.name
  end

  def index
    @cars = Car.includes(:brand, :model).order(order_hash).page(params[:page]).per(16)
    track_event('cars', 'voorraad bekeken')
  end

  def search
    @cars = Car.query(params[:q]).includes(:brand, :model).order(order_hash).page(params[:page])
    if request.xhr?
      render :search, layout: false
    else
      track_event('cars', 'zoek resultaten bekeken')
      render :index
    end
    add_breadcrumb 'Search'
  end

  def nieuw_binnen
    @cars = Car.week_old.includes(:brand, :model).order(order_hash).page(params[:page])
    render :index
  end

  def finance_ash_car
    car = Car.find_by_vehicle_number_hexon(params[:car])
    return redirect_to financing_cars_path(params[:type] || 'private') + '#car/' + car.id.to_s if car.present?
    type = params[:type].present? && ['private', 'business', '50_50'].include?(params[:type]) ? params[:type] : 'bussiness'
    type.gsub!('business', 'bussiness')
    track_event('cars', 'finance request via ash binnengekomen', car.try(:display_name), type)
    redirect_to financing_cars_path(type)
  end

  def financing
    @type = 'private'
    if params[:type].present? and ['private', '50_50', 'bussiness'].include?(params[:type])
      @type = params[:type]
    end
    track_event 'cars', 'Auto finance button geklikt', @type
    add_breadcrumb 'Financieren'
  end

end