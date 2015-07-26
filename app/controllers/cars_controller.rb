class CarsController < ApplicationController

  add_breadcrumb 'Autos', :voorraad_cars_path

  caches_action :brand, :model, :search, :index

  def home
    @cars = Car.all.car_includes.limit(3).order(created_at: :asc)
    references = Reference.where(approved: true)
    @references = references.limit(2)
    @reference_avarage = Reference.avarage(references)
    @cms_fields = CmsField.first
  end

  def show
    @car = Car.find(params[:id])
    add_breadcrumb @car.display_name
  end

  def brand
    @brand = Brand.find(params[:brand_id])
    @cars = @brand.cars.car_includes.order(created_at: :asc)
    add_breadcrumb @brand.name
  end

  def model
    @model = Model.find(params[:model_id])
    @cars = @model.cars.car_includes.order(created_at: :asc)
    add_breadcrumb @model.name
  end

  def index
    @cars = Car.order(created_at: :asc).page(params[:page]).per(15)
  end

  def search
    @cars = Car.query(params[:q])
    @cars = Kaminari.paginate_array(@cars).page(params[:page])
    if request.xhr?
      render :search, layout: false
    else
      render :index
    end
    add_breadcrumb 'Search'
  end

  def nieuw_binnen
    @cars = Kaminari.paginate_array(Car.week_old).page(params[:page])
    render :index
  end

  def financing
    @type = 'private'
    if params[:type].present? and ['private', '50_50', 'bussiness'].include?(params[:type])
      @type = params[:type]
    end
    add_breadcrumb 'Financieren'
  end

end