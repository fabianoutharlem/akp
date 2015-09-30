module Admin
  class CarsController < AdminBaseController

    def index
      @cars = Car.all.car_includes
    end

    def destroy
      Car.find(params[:id]).destroy
      redirect_to admin_cars_path
    end

  end
end