class CarsController < ApplicationController

  add_breadcrumb 'Autos', :cars_path

  def home
    @cars = Car.all.limit(3).order(created_at: :asc)
  end

  def show
    @car = Car.find(params[:id])
    add_breadcrumb @car.display_name
  end

  def brand
    @brand = Brand.find(params[:brand_id])
    @cars = @brand.cars
    add_breadcrumb @brand.name
  end

  def index
    @cars = Car.all
  end

  def search
    @cars = Car.query(params[:q])

    if request.xhr?
      render :search, layout: false
    else
      render :index
    end
  end

  def nieuw_binnen
    @cars = Car.week_old
    render :index
  end

  def financing
    @type = 'private'
    if params[:type].present? and ['private', '50_50', 'bussiness'].include?(params[:type])
      @type = params[:type]
    end
  end

end