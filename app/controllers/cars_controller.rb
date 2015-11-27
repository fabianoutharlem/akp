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
    @cars = Car.limit(100).includes(:brand, :model).order(order_hash).page(params[:page]).per(16)
  end

  def search
    @cars = Car.query(params[:q]).order(order_hash).to_a
    @cars = Kaminari.paginate_array(@cars).page(params[:page])
    if request.xhr?
      render :search, layout: false
    else
      render :index
    end
    add_breadcrumb 'Search'
  end

  def nieuw_binnen
    @cars = Kaminari.paginate_array(Car.week_old.order(order_hash)).page(params[:page])
    render :index
  end

  def finance_ash_car
    if params[:car].present? and (car = Car.find_by_vehicle_number_hexon(params[:car])).present?
      return redirect_to financing_cars_path('private') + '#car/' + car.id.to_s if car.present?
    end
    type = params[:type].present? && ['private', 'business'].include?(params[:type]) ? params[:type] : 'bussiness'
    type.gsub!('business', 'bussiness')
    redirect_to financing_cars_path(type)
  end

  def financing
    @type = 'private'
    if params[:type].present? and ['private', '50_50', 'bussiness'].include?(params[:type])
      @type = params[:type]
    end
    add_breadcrumb 'Financieren'
  end

  private

  def order_hash
    field = (params[:sort_field] || 'brands.name, models.name, car_type')
    direction = (params[:sort_direction] || :asc).to_sym
    "#{field} #{direction}"
  end

end