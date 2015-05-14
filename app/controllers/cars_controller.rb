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
    if params[:query]
      @cars = Car.query(params[:query])
    end
    render :index
  end

  def nieuw_binnen
    @cars = Car.week_old
    render :index
  end

end